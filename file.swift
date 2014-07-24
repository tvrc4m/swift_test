import Foundation

var sourcePath="";
var desPath="";

var fileManager=NSFileManager()

var currentPath=fileManager.currentDirectoryPath

var githubPath="/var/github/swift/objc/"

var error:NSError?;

var files=fileManager.contentsOfDirectoryAtPath(githubPath,error:&error)

for file:AnyObject in files{
	var f=file as String
	//println(githubPath+f)
	//var data=fileManager.contentsAtPath(githubPath+f)
	//println(data)
}

var enums=fileManager.enumeratorAtPath(githubPath)
var next:AnyObject?=enums.nextObject()
while next{
	println(next)
	next=enums.nextObject()
}
//println(enums)

