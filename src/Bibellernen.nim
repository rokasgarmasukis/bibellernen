import jester, asyncdispatch

import models/userModel
import ./database/database
import bcrypt



# var salt = genSalt(10)
# var password = "secret"

# var hashedPassword = hash(password, salt)

# var user: User
# user = User(username: "Rokas", password: hashedPassword, salt: salt)

var db = newDatabase()

# createUser(db, user)
# loginUser(db, "Rokas", "secret")

routes:
  get "/@name":
    resp db.findUserId(@"name")

  get "/":
    resp "index"

runForever()