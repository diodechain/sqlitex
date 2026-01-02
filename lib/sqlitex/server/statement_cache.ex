defmodule Sqlitex.Server.StatementCache do
  @moduledoc """
  Implements a least-recently used (LRU) cache for prepared SQLite statements.

  Caches a fixed number of prepared statements and purges the statements which
  were least-recently used when that limit is exceeded.
  """

  defstruct db: false, limit: 1, cached_stmts: %{}

  @doc """
  Creates a new prepared statement cache.
  """
  def new(db, limit) when is_integer(limit) and limit > 0 do
    %__MODULE__{db: db, limit: limit}
  end

  @doc """
  Given a statement cache and an SQL statement (string), returns a tuple containing
  the updated statement cache and a prepared SQL statement.

  If possible, reuses an existing prepared statement. If not, prepares the statement
  and adds it to the cache, possibly removing the least-recently used prepared
  statement if the designated cache size limit would be exceeded.

  Will return `{:error, reason}` if SQLite is unable to prepare the statement.
  """
  def prepare(%__MODULE__{cached_stmts: cached_stmts} = cache, sql, opts \\ [])
      when is_binary(sql) and byte_size(sql) > 0 do
    case Map.fetch(cached_stmts, sql) do
      {:ok, stmt} -> {update_cache_for_read(cache, sql), stmt}
      :error -> prepare_new_statement(cache, sql, opts)
    end
  end

  defp prepare_new_statement(%__MODULE__{db: db} = cache, sql, opts) do
    case Sqlitex.Statement.prepare(db, sql, opts) do
      {:ok, prepared} ->
        cache =
          cache
          |> store_new_stmt(sql, prepared)
          |> update_cache_for_read(sql)
          |> purge_cache_if_full

        {cache, prepared}

      error ->
        error
    end
  end

  defp store_new_stmt(%__MODULE__{cached_stmts: cached_stmts} = cache, sql, prepared) do
    %{cache | cached_stmts: Map.put(cached_stmts, sql, prepared)}
  end

  defp purge_cache_if_full(
         %__MODULE__{
           limit: limit,
           cached_stmts: cached_stmts
         } = cache
       ) do
    if map_size(cached_stmts) > 2 * limit do
      cached_stmts =
        Enum.sort_by(cached_stmts, fn {_sql, stmt} -> stmt.last_used end, :desc)
        |> Enum.take(limit)
        |> Map.new()

      %{cache | cached_stmts: cached_stmts}
    else
      cache
    end
  end

  defp purge_cache_if_full(cache), do: cache

  defp update_cache_for_read(cache = %__MODULE__{cached_stmts: cached_stmts}, sql) do
    cached_stmts =
      Map.update!(cached_stmts, sql, fn
        stmt -> %{stmt | last_used: System.os_time(:millisecond)}
      end)

    %{cache | cached_stmts: cached_stmts}
  end
end
