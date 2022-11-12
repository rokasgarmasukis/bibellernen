import models/userModel
import ./database/database
import os, bcrypt

echo("Hello, Rokas!")

var user: User
user = User(username: "Rokas", password: "secret", salt: "salt")

var db = newDatabase()

createUser(db, user)