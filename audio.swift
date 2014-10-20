import Cocoa
import AVFoundation


var error:NSError?

let manager=NSFileManager.defaultManager()

let basePath="/music/"

var files=manager.contentsOfDirectoryAtPath(basePath,error:&error)

//var player:AVAudioPlayer?

var Qmain=dispatch_get_main_queue()

var app=NSApplication.sharedApplication()



func play(f:String) {
	//dispatch_sync(Qmain){
		var player=AVAudioPlayer(contentsOfURL:NSURL(string:basePath+f),error:&error)
		player.prepareToPlay()
		player.play()
	//}
}

for file in files {
	if file.pathExtension=="mp3" {
		play(file as String)
		sleep(30)
	}
}


app.run()

sleep(60)