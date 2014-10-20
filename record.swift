import Cocoa
import AVFoundation

var app=NSApplication.sharedApplication()

let root=NSFileManager.defaultManager().currentDirectoryPath as String
let build=root+"/build/"
let name="record.caf"

var error:NSError?

var settings=[AVEncoderBitRateKey:16,AVSampleRateKey:44100]

var recorder=AVAudioRecorder(URL:NSURL(string:build+name),settings:settings,error:&error)

println(error)

if recorder.prepareToRecord() {
	recorder.recordForDuration(10)
}else {
	println("can not create file")
}

recorder.record()

app.run()