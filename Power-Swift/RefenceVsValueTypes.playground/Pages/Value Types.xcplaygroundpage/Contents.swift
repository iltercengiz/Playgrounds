//: [<--Explore Reference Types--](@previous)

/*:
# Exploring Value Types
This time, we're going to make a person value.
Structs are value types.
When instantiated, it creates a copy of the object
*/

struct Person: CustomStringConvertible {
    
    // Since a person's name DOES NOT change, it's a constant
    let name: String
    
    // Changing the age of this person value will create a brand new person copy with the new age!
    var age: Int
    
    // comment out this init and see what happens!
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    // conforming to the CustomStringConvertible protocol for easier debugging
    var description: String {
        return "Name: \(name), Age: \(age)"
    }
}

/*:
    Let's try this again. Creating the patron goddess of Swift... Taylor Swift!!!
*/
let taylorSwift = Person(name: "Taylor Swift", age: 25)

/*:
Now, go ahead and create yourself as a Person value this time!
*/

// let you =

/*:
Let's re-work our birthday time travel machine...
This time, we'll pass in a person value
*/

// take out the var here in the passed in parameter to see what happens
func timeTravelToBirthdayForPerson(var person: Person) {
    // cloning the person we have (with one small change)
    // remember, by adding one year, we're creating yet another copy of the person!
    person.age += 1
    
    // Success, our clone is one year older
    person

    // let's have some fun!!!
    🎉🎂🎁🎈💥()
}

func 🎉🎂🎁🎈💥() {
    print("I love rock and roll. So come and take your time and dance with me")
}

/*:
Ok, let's try this again... 
Things might go horribly wrong...
But 🎂 and 🎈s and 🎁s!!!!
Ok, fine, let's do it!!!!
It's totally worth the risk...
🚀
*/

timeTravelToBirthdayForPerson(taylorSwift)

/*:
Go ahead and travel to your birthday as well... 
You know you want to!
*/

// timeTravelToBirthdayForPerson(you)

/*:
Let's check on Taylor... 😰
*/

taylorSwift

/*:
Phew! Everything is looking good. She's still the same Taylor, age 25 and all...
Time to check on yourself... 😰
*/

// you

/*:
Looks like it's all good captain! We've fixed the horrible time travel bug! 😅
*/

/*:
**Summary**: Value Types are copied every time they're passed to a function or mutated. When you're modifying a value type, you're modifying a copy of it, never the original... so your original value is always safe!

When working in Swift, prefer value types over reference types!
*/

//: [--Level Up on Value Types -->](@next)



