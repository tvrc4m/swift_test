import Cocoa
import AVFoundation

var app=NSApplication.sharedApplication()

let path="/mv/G.E.M/paomo.mp4"

var url=NSURL(string:path)

var player=AVPlayer(URL:url)

player.play()

println(player.error)

app.run()