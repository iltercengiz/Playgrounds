
import Foundation

/*:
## Error Handling in Swift
In this playground, we're going to convert data (imagine it coming from an API) into a value we can use in our future app
*/

// Consider this the data coming from the API (after it's been deserialized). This data tends to be very messy
let todoItemDictionary: [String : AnyObject] = [
    "completed": false,
    "due_on": "2015-07-08",
    "description": "Facebook app and contest"
]

/*:
The goal is to convert the data into a very clean model that can be used throughout the application
*/
struct TodoItem {
    
    // This is the description of the task that needs to be done
    let description: String
    
    // The due date here is optional, since not all tasks need to have timelines
    let dueDate: String?
    
    // Keeping track of whether the todo item is completed or not
    // Note that when this item is set to complete, a brand new todo item copy gets created with the different complete value
    var completed: Bool
}

/*:
The `TodoItemParser` is an in-between container for dealing with the messy data coming from the API and converting it into the clean model layer we can safely and cheerfully use within our future application

Read more about this concept here: http://www.jessesquires.com/swift-failable-initializers-revisited/
*/
struct TodoItemParser {
    
    enum Error: ErrorType {
        case InvalidData
    }
    
    func parse(fromData data: [String : AnyObject]) throws -> TodoItem {
        
        // the defer statement will execute whether the parsing is successful or not!
        // open up the Debug area to see it!
        defer { print("parsing complete!") }
        
        // use guard here to focus on the happy path
        // read more about it on my blog here: http://natashatherobot.com/swift-guard-better-than-if/
        guard let content = data["description"] as? String,
            completed = data["completed"] as? Bool,
            dueDate = data["due_on"] as? String?
            else {
                // handle the error case
                throw Error.InvalidData
        }

        return TodoItem(description: content, dueDate: dueDate, completed: completed)
    }
}

/*:
### Task: Refactor the TodoItemParser to throw a different error for each invalid field (e.g. DescriptionInvalid, CompletedInvalid, DueOnInvalid)
*/

/*: 
Now, let's actually parse the data dictionary using the do / catch error handlign in Swift!
*/

// In Swift, we do this using the do / catch block
do {
    // success!
    let todoItem = try TodoItemParser().parse(fromData: todoItemDictionary)
    print(todoItem)
} catch TodoItemParser.Error.InvalidData {
    // failure
    // note that you can specify which error you're catching
    // or you can just use catch on it's own to catch all errors
    print("😱 the data is invalid!!!")
}

/*:
Parse invalid data to see what happens!
*/

do {
    let todoItem = try TodoItemParser().parse(fromData: ["badDataTroll" : "😈"])
    print(todoItem)
} catch TodoItemParser.Error.InvalidData {
    print("😱 the data is invalid!!!")
}


/*:
### Task: Refactor the error catching to catch your additonal errors (e.g. DescriptionInvalid, CompletedInvalid, DueOnInvalid).
*/

/*:
Now, let's try?
*/

// Instead of the do / catch block, you have the option of treating bad data as an optional
let todoItem = try? TodoItemParser().parse(fromData: todoItemDictionary)

// the todoItem is an optional, so don't forget to unwrap to use it!
if let todoItem = todoItem {
    print("The todo item parsing was a success! 🎉")
}

/*:
## Task: Try? parsing the todo item from invalid data to see what happens
*/

// let invalidTodoTime = try? ...





