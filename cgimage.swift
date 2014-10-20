
import Cocoa

var image=NSImage(contentsOfFile:"/var/root/Downloads/tvrc4m_100.jpg")

var idata=image.TIFFRepresentation

var bitimage:CGImageRef?=nil

if idata{
	var news=idata as CFDataRef
	var source=CGImageSourceCreateWithData(news,nil)
	//println(source)
	var s=source as CGImageSource
	var bitimage=CGImageSourceCreateImageAtIndex(s,0,nil)
	//println(bitimage)
}

