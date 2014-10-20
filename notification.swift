import Cocoa

class Notification{

	func message(text:String)->Int{
		println("notification test")
		return 0
	}
}

var notification=Notification()

var center=NSNotificationCenter.defaultCenter()

center.addObserver(notification,selector:"message",name:"message",object:nil);


center.postNotification("message")

notification.message("hello")
