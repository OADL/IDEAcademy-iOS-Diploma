import UIKit


// Singleton

class Animal {
    
    private static var initializer : Animal?
    
    var name : String = ""
    
    private init(n : String) {
        self.name = n
    }
    
    static func initialize(n : String) -> Animal {
        if Animal.initializer == nil {
            Animal.initializer = Animal(n: n)
        }
        return Animal.initializer!
    }
}

var fox = Animal.initialize(n: "fox")

fox.name

var dog = Animal.initialize(n: "dog")

dog.name

// Throw Catch

enum errors : Error {
    case incorrectPassword
    case incorrectName
}

func checkPass(password: String) throws {
    
    if(password == "lolo"){
        throw errors.incorrectPassword
    }else if password == "hamada"{
        throw errors.incorrectName
    }
    print("done")
}


do {
    try checkPass(password: "hamada")
}catch {
    print("erooor")
}

try? checkPass(password: "lolo")

//try! checkPass(password: "lolo")  //error returned
