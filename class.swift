import Foundation

class Customer {
	var firstname:String
	var lastname:String
	var customer_id:UInt?

	init(firstname fname:String,lastname lname:String){
		firstname=fname
		lastname=lname
	}
	var fullname:String{
		return firstname+" "+lastname
	}
	var id:UInt{
		return customer_id!
	}
}

protocol BaseModel {
	
}

class Model :BaseModel{
	
	class func getInstance()->Model{
		struct Singleton {
			static var once:dispatch_once_t=0
			static var instance:Model?=nil
		}
		if !Singleton.instance{
			dispatch_once(&Singleton.once){
				Singleton.instance=Model()
			}
		}
		return Singleton.instance!
	}
}

class DB : Model {
	
}

var instance:Model?
var db:DB?

for _ in 1...10{
	instance=Model()
	println(instance)
	db=DB()
	println(db)
}

var customer=Customer(firstname:"teric",lastname:"wei")
println("fullname is \(customer.fullname)")



