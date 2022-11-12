import db_sqlite
import ../database/database

type
  User* = object
    username*: string
    password*: string
    salt*: string

#? Database creation
proc setupUser*(database: Database) =
  database.db.exec(sql"DROP TABLE IF EXISTS User")
  database.db.exec(sql"""
      CREATE TABLE IF NOT EXISTS User(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username VARCHAR(50) NOT NULL,
        password VARCHAR(50) NOT NULL,
        salt VARCHAR(50) NOT NULL
      );
  """)

proc createUser*(database: Database, user: User) =
  database.db.exec(sql"INSERT INTO User (username, password, salt) VALUES (?, ?, ?);", user.username, user.password, user.salt)

