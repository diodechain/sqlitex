
File.rm("test_db.sq3")

{:ok, db} = Sqlitex.open("test_db.sq3")
:ok = Sqlitex.exec(db, "PRAGMA journal_mode = WAL")
:ok = Sqlitex.exec(db, "PRAGMA synchronous = NORMAL")
:ok = Sqlitex.exec(db, "CREATE TABLE t (a INTEGER, b INTEGER, c INTEGER)")

for i <- 1..10 do
  ret = Sqlitex.query_rows!(db, "INSERT INTO t VALUES (#{i}, #{i * i}, #{i * i * i})")
  IO.inspect(ret, label: "ret")
end

Sqlitex.close(db)
