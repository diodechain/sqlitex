defmodule Sqlitex.Server.StatementCacheTest do
  use ExUnit.Case

  alias Sqlitex.Server.StatementCache, as: S
  alias Sqlitex.Statement, as: Stmt

  test "basic happy path" do
    {:ok, db} = Sqlitex.open(":memory:")

    cache = S.new(db, 3)
    assert %S{cached_stmts: %{}, db: _, limit: 3, lru: [], size: 0} = cache

    {cache, stmt1a} = S.prepare(cache, "SELECT 42")
    assert %Stmt{column_names: [:"42"], column_types: [nil]} = stmt1a

    {cache, stmt2a} = S.prepare(cache, "SELECT 43", db_timeout: 5_000)
    assert %Stmt{column_names: [:"43"], column_types: [nil]} = stmt2a

    {cache, stmt3} = S.prepare(cache, "SELECT 44")
    assert %Stmt{column_names: [:"44"], column_types: [nil]} = stmt3

    {cache, stmt1b} = S.prepare(cache, "SELECT 42", db_timeout: 5_000)
    # shouldn't have been purged
    assert stmt1a == stmt1b

    {cache, stmt4} = S.prepare(cache, "SELECT 353")
    assert %Stmt{column_names: [:"353"], column_types: [nil]} = stmt4

    {_cache, stmt2b} = S.prepare(cache, "SELECT 42", db_timeout: 5_000)
    # should have been purged
    refute stmt2a == stmt2b
  end

  test "relays error in prepare" do
    {:ok, db} = Sqlitex.open(":memory:")
    cache = S.new(db, 3)

    assert {:error, {:sqlite_error, 'near "bogus": syntax error'}} =
             S.prepare(cache, "bogus", db_timeout: 5_000)
  end
end
