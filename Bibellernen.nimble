# Package

version       = "0.1.0"
author        = "Rokas Garmasukis"
description   = "Eine App zum Lernen die Bibel"
license       = "MIT"
srcDir        = "src"
bin           = @["Bibellernen"]
skipExt       = @["nim"]


# Dependencies

requires "nim >= 1.6.8", "jester >= 0.0.1"
