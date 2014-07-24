import sqlite3
var db:COpaquePointer = nil
sqlite3_open("/var/sqlite/fastty.db",&db)
println(db)