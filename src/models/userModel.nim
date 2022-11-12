import db_sqlite
import ../database/database
import bcrypt

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
  # check for uniqueness
  database.db.exec(sql"INSERT INTO User (username, password, salt) VALUES (?, ?, ?);", user.username, user.password, user.salt)


proc loginUser*(database: Database, username: string, password: string) =
  let userInfo = database.db.getRow(sql"SELECT * FROM User WHERE username = ?;", username)
  echo(userInfo.repr)
  if userInfo[1].len == 0:
    echo "no user found"
  elif userInfo[2] == hash(password, userInfo[3]):
    echo("User found")
  else:
    echo("Wrong password")

proc findUserId*(database: Database, username: string): string =
  let userId = database.db.getValue(sql"SELECT id FROM User WHERE username = ?", username)
  result = ""
  if userId.len == 0:
    result.add("not found")
  else:
    result.add("User ID: " & userId)