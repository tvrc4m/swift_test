import Cocoa
import AudioToolbox

var url=NSURL(string:"/var/root/Download/Dont_Cry.ape")

AudioFileOpenURL(url,kAudioFileReadPermission)