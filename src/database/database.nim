import db_sqlite

type
  Database* = ref object
    db*: DbConn


proc newDatabase*(filename = "bibellernen.db"): Database =
  new result
  result.db = open(filename, "", "", "")

# proc open*(database: Database, filename = "bibellernen.db") =
#   database.db.open

proc close*(database: Database) =
  database.db.close()
