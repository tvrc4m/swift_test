import Foundation

var serial=dispatch_queue_create("serial",DISPATCH_QUEUE_SERIAL)
println(serial)
var concurrent=dispatch_queue_create("concurrent",DISPATCH_QUEUE_CONCURRENT)
var key="serial"
var special=dispatch_get_specific(&key)
println(special)

//var current=dispatch_get_current_queue()  // deprecated
//println(current)

var main=dispatch_get_main_queue() //serial
println(main)

//DISPATCH_QUEUE_PRIORITY_HIGH,DISPATCH_QUEUE_PRIORITY_LOW,DISPATCH_QUEUE_PRIORITY_DEFAULT,DISPATCH_QUEUE_PRIORITY_BACKGROUND


var global_high=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0)
println(global_high)
var global_low=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW,0)
println(global_low)
var global_default=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
println(global_default)
var global_backgroup=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0)
println(global_backgroup)

// Submits a block object for execution on a dispatch queue and waits until that block completes.
println("sync start")
dispatch_sync(serial){
	for _ in 1..<10{
		println("sync")
	}
}

println("sync end")

//println("sync_f start")

//var context="hello"
//dispatch_sync_f(queue,&context){
//	(pass:String->()) in 
//	println(pass)
//}

//println("sync_f end")

println("async start")

dispatch_async(global_high){
	for i in 1..<10{
		println(i)
	}
}

println("async end")

println("dispatch after start")
dispatch_after(dispatch_time(DISPATCH_TIME_NOW,8000),serial){
	println("after start")
}


println("dispatch after end")


dispatch_apply(10,serial){
	(i:UInt) in 
	println("apply \(i)")
}


// dispatch global
var group=dispatch_group_create()
dispatch_group_async(group,concurrent){
	for _ in 1...20{
		println("group 1 done")
	}
}
dispatch_group_async(group,concurrent){
	for _ in 1...20{
		println("group 2 done")
	}
}

var file=fopen("/test.swift","r+")

println("pass every time \(file)")

//dispatch_read(file,10,concurrent){
//	println($0)
//}



// dispatch source

// timer
var timer=dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER,0,0,serial)

dispatch_source_set_timer(timer,DISPATCH_TIME_NOW,5*NSEC_PER_SEC,0)

dispatch_source_set_event_handler(timer){
	println("timer runing")
}

dispatch_resume(timer)

// file write


var fd=open("/swift/gcd.swift",O_RDWR)

println("FILE DESCRIPTOR \(fd)")

var reader=dispatch_source_create(DISPATCH_SOURCE_TYPE_READ,1,0,serial)

dispatch_source_set_event_handler(reader){
	var data=dispatch_source_get_data(reader)
	println("read now")
	dispatch_suspend(reader)
}

dispatch_resume(reader)

var path="/swift/gcd.swift" as CString;

//var io=dispatch_io_create_with_path(DISPATCH_IO_STREAM,path,O_RDONLY,0,serial){
//	println("read swift file")
//}

//dispatch_io_read(io,0,100,serial){
//	(done:Bool,data:dispatch_data_t,error:Int)->() in
//		println(data)
//}

var data="hello"

var source_data=dispatch_data_create(&data,5,serial){

}
println(source_data)

sleep(15)

dispatch_release(serial)