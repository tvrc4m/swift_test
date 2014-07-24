import AVFoundation
import Cocoa


var app=NSApplication.sharedApplication()
app.run()


let path="/music/"
var error:NSError?


var directory=NSFileManager.defaultManager()

//var player:AVAudioPlayer?

directory.changeCurrentDirectoryPath(path)

for f in directory.contentsOfDirectoryAtPath(path,error:&error){
	var file=f as String
	if directory.fileExistsAtPath(file) && !file.pathExtension.isEmpty {
		var data=NSData(contentsOfFile:path+file)
		if data==nil {
		}else{

			dispatch_sync(dispatch_get_main_queue()){
				var player=AVAudioPlayer(data:data,error:&error)
			player.prepareToPlay()
			player.play()
			}
			
		}
	}
	break
}
sleep(20)
//app.run()


//var window:NSWindow=NSWindow(frame:CGRectMake(x,y,w,h),styleMask:NSTitledWindowMask,backing:NSBackingStoreType.NSBackingStoreRetained)
//app.windows+=window



