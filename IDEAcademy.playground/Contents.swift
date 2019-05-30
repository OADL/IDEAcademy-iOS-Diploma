import UIKit

class Person{

    enum Nationality {
        case Egyptian , American , English , Turkish
    }
    
    var name : String = "no name"
    var age : Int = 0
    var height : Int = 0
    var nationality = Nationality.American
    
    init(_name: String , _age: Int , _height: Int) {
        name = _name
        age = _age
        height = _height
    }
    
    init(_name: String , _age: Int , _height: Int , _nationality : Nationality) {
        name = _name
        age = _age
        height = _height
        nationality = _nationality
    }
    
    func walk() {
        print("\(self.name) started walking....")
    }
    
    func isShort() -> Bool {
        if(height < 150){
            return true
        }else{
            return false
        }
    }
    
    func toString() -> String{
        let string =
        """
        Name: \(name)
        Age: \(age)
        Height: \(height)
        Nationality: \(nationality)
        """
        
        return string
    }
    
}


var person1 = Person(_name: "omar", _age: 23, _height: 172, _nationality: .Egyptian)

person1.isShort()

//person1.walk()

person1.nationality

var persons: [Person] = [person1]

//print(persons[0].toString())

class Animal {
    
    var hasHair = false
    
    func breathe(){
        print("Breathing...")
    }
    
}


class Dog:Animal{
    
    override func breathe() {
        super.breathe()
        print("breathing dog")
    }
    
    func bark(){
        print("Barking....")
    }
    
}

class germanDog: Dog{
    
    var isHealthy = true
 
    override func bark() {
        print("German barking woof woof")
    }
    
}

let puppy = Dog()

//puppy.breathe()

//puppy.bark()

let puppyGerman = germanDog()

//puppyGerman.bark()

//puppyGerman.breathe()

//internary operator

var number = 1

//number == 1 ? print(number) : print("no")

// "is" ask for type

// "as!" force to cast

// "any" any data type entered

class Fish : Animal {
    
    override func breathe() {
        print("Fish blo2 blo2 blo2.....")
    }
    
}


let myDog = Dog()
let myFish = Fish()
let myAnimal = Animal()

let animals : [Animal] = [myAnimal,myFish,myDog]

let fish = animals[1] as? Dog

let data : [Any] = [myDog,"1",myFish,myAnimal]

//if let a = data[0] as? Dog {
//    a.bark()
//}

//func doSomething(){
//    guard let a = data[2] as? Fish else { return }
//
//    a.breathe()
//}

//doSomething()

//==================PROTOCOLS=============================

// delegate property byb3at y2ol nafezly el haga el mo3ayana

protocol PoliceCodes{
    
    var x : Int{ get }

    func NineOneOne()

}

class Officer {
    var radio: PoliceCodes?
    
    func reportKillCrime(){
        radio?.NineOneOne()
    }
}

class Reciever: PoliceCodes {
    
    var x: Int
    
    init(x: Int) {
        self.x = x
    }
    
    func NineOneOne() {
        print("Reported for a kill. me: \(self.x)")
    }
}

let officer = Officer()
let theOffice = Reciever(x: 10)
officer.radio = theOffice
//officer.reportKillCrime()

//=======EXTENSIONS==========

extension Animal {
    func run(){
        print("Running running")
    }
}

//myDog.run()

extension Int {
    func doubled() -> Int {
        return self * self
    }
}

print(10.doubled())
