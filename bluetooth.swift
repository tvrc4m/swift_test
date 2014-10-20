import Cocoa
import CoreBluetooth

class MyBluetooth :NSObject, CBCentralManagerDelegate{

	var manager:CBCentralManager?
	var server:CBService?

	init () {
		super.init()
		manager=CBCentralManager(delegate:self,queue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0))

	}

	func scan(){
		var settings=[CBCentralManagerScanOptionAllowDuplicatesKey:true]
		println("start")
		manager!.scanForPeripheralsWithServices(nil,options:settings)
		println(manager)
	}

	func centralManager(manager:CBCentralManager,didDiscoverPeripheral:CBPeripheral,advertisementData:NSDictionary,RSSI:NSNumber) {
		println(manager)
	}

	func centralManager(manager:CBCentralManager,didDiscoverPeripheral:CBPeripheral,advertisementData:NSDictionary,RSSI:Int){
		println(didDiscoverPeripheral)
	}

	func centralManagerDidUpdateState(manager:CBCentralManager){

	}
}

var app=NSApplication.sharedApplication()

var bluetooth=MyBluetooth()
bluetooth.scan()

app.run()
//sleep(60)