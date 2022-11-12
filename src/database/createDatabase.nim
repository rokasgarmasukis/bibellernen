import ../models/userModel
import database

var db = newDatabase()
db.setupUser()
echo("Database created successfully!")
db.close()