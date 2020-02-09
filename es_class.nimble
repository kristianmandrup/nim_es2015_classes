# Package

version       = "0.1.0"
author        = "zacharycarter"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["es_class.js"]
binDir        = "bin"
installExt    = @["nim"]
backend       = "js"

# Dependencies

requires "nim >= 0.18.1"
requires "ast_pattern_matching >= 1.0.0"
requires "https://github.com/zacharycarter/litz.git"

task test, "run es_class tests":
  withDir "tests":
    exec "nim js test_es2015_class.nim"
    exec "node runner.js"

task dtest, "run es_class tests w/ nes debug flag on":
  withDir "tests":
    exec "nim js -d:debugNES test_es2015_class.nim"
    exec "node runner.js"
  
task mtools, "run macro tools":
  withDir "tools":
    exec "nim c -r mtools.nim"