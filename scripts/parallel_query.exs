
if not File.exists?("test_db.sq3") do
  {:ok, db} = Sqlitex.open("test_db.sq3")
  :ok = Sqlitex.exec(db, "PRAGMA journal_mode = WAL")
  :ok = Sqlitex.exec(db, "PRAGMA synchronous = NORMAL")
  :ok = Sqlitex.exec(db, "CREATE TABLE t (a INTEGER, b INTEGER, c INTEGER)")
  for i <- 1..10_000 do
    :ok = Sqlitex.exec(db, "INSERT INTO t VALUES (#{i}, #{i * i}, #{i * i * i})")
  end
  Sqlitex.close(db)
end

spawn_db = fn ->
  {:ok, db} = Sqlitex.open("test_db.sq3")
  :ok = Sqlitex.exec(db, "PRAGMA journal_mode = WAL")
  :ok = Sqlitex.exec(db, "PRAGMA synchronous = NORMAL")
  db
end

spawn_server = fn ->
  {:ok, server} = Sqlitex.Server.start_link("test_db.sq3")
  :ok = Sqlitex.Server.exec(server, "PRAGMA journal_mode = WAL")
  :ok = Sqlitex.Server.exec(server, "PRAGMA synchronous = NORMAL")
  server
end

size = 10
server = 1..size |> Enum.map(fn _ -> spawn_server.() end)
db = 1..size |> Enum.map(fn _ -> spawn_db.() end)

server_query = fn ->
  Task.async_stream(1..1_000, fn i ->
    Enum.at(server, rem(i, size))
    |> Sqlitex.Server.query("SELECT * FROM t WHERE a = ?", bind: [i])
  end)
  |> Stream.run()
end

db_query = fn ->
  Task.async_stream(1..1_000, fn i ->
    Enum.at(db, rem(i, size))
    |> Sqlitex.query("SELECT * FROM t WHERE a = ?", bind: [i])
  end)
  |> Stream.run()
end


Benchee.run(
  %{
    "server_query" => server_query,
    "db_query" => db_query
  },
  time: 10,
  memory_time: 2
)
