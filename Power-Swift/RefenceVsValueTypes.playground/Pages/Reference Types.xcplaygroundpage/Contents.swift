
/*:

# Exploring Reference Types
We'll start by creating a simple person class. 
This person is a reference type - 
when instantiated, we have a reference to it in memory
*/

class Person: CustomStringConvertible {
    
    // Since a person's name DOES NOT change, it's a constant
    let name: String
    
    // Since a person's age DOES change, it's a variable
    var age: Int
    
    // comment out this init and see what happens!
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // Note: The description is needed for conformance 
    // to the CustomStringConvertible protocol
    // This makes it easier to debug
    
    // Change the description string, and see what happens!
    var description: String {
        return "Name: \(name), Age: \(age)"
    }
}

/*:
Of course, the most important person we're going to create is Taylor Swift - the patron goddess of Swift!
*/

let taylorSwift = Person(name: "Taylor Swift", age: 25)

/*: 
Now, go ahead and create yourself as a Person!
*/

// let you =

/*: 
    Why not time travel to a persons birthday and celebrate? Woudln't that be fun?!! Just think of all that delicious 🎂. And who doesn't like 🎁s?
*/

func timeTravelToBirthdayForPerson(person: Person) {
    
    // since it's the person's birthday,
    // we have to add a year on to their age
    person.age += 1

    // and now we can celebrate!!!
    🎉🎂🎁🎈💥()
}

func 🎉🎂🎁🎈💥() {
    print("Celebrate good times, come on! (Let's celebrate)")
}

/*:
Ok, ready to time travel?!!! Let's do it.
But be warned, time travel is serious business!
It could be dangerous. 
But 🎂!
Ok, let's do it!
🚀
*/

timeTravelToBirthdayForPerson(taylorSwift)

/*: 
Go ahead... time travel to your birthday as well! 
You know you want 🎁s!
*/

// timeTravelToBirthdayForPerson(you)

/*:
Ok, let's check on the Taylor Swift to make sure everything is 
alright...
*/

taylorSwift

/*:
😱
So something went horribly wrong... We've accidently aged today's Taylor Swift...
What about you?!!!
*/

//  check out the description of you --->
// you

/*:
😱
You've accidently aged your current self!!!!
*/

/*:
**Summary**: Reference Types point to a an object in memory. When you're modifying a reference type, you're modifying the original copy... so you have to be careful... something could go terribly wrong
*/

//: [--Explore Value Types -->](@next)
