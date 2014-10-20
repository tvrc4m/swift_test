import Foundation
import AVFoundation

var player=AVPlayer(URL:NSURL(string:"/music/Imagine.wav"))
player.play()
println(player.error)
sleep(30)