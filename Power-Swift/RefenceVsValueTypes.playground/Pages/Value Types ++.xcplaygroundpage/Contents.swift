//: [<--Explore Value Types--](@previous)

/*:
# Level Up on Value Types
In this tutorial, we're going to have a simple example of a todo list to keep exploring the concept of immutability of value types and how to work with them
*/

import Foundation

/*:
Here is our TodoItem struct. It's pretty straight-forward. The only difference is that it is a value type.
*/

struct TodoItem {
    
    // This is the description of the task that needs to be done
    let description: String
    
    // The due date here is optional, since not all tasks need to have timelines
    let dueDate: NSDate?
    
    // Keeping track of whether the todo item is completed or not
    // Note that when this item is set to complete, a brand new todo item copy gets created with the different complete value
    var completed: Bool
}

/*:
We need an array to keep track of all the todo items. 
Note that this array needs to be a variable - every time a todo item inside of it gets changed, it gets re-assigned to a whole new copy of the this array!
*/

var todoItems = [
    TodoItem(description: "Complete this tutorial", dueDate: NSDate(), completed: false)
    // create additional todo items!
]

/*:
To complete to a todo item, we need to create a new copy of the todo item, with the opposite value for the completed property. 
Note the functional aspect of this function. A value is placed in, tranformed, and a new one is returned with no unwanted side effects (such as mutating the original todoItem). This would be really easy to test.
*/

func toggleCompletionForTodoItem(var todoItem: TodoItem) -> TodoItem {
    // note that toggling the status of the todoItem 
    // replaces the todoItem variable that is passed in with 
    // a brand new toodItem value
    todoItem.completed = !todoItem.completed
    return todoItem
}

todoItems

/*:
Your friend decides to mess with you, so they go through all your todo items, and toggle the completion status 😈.
*/
for (index, todoItem) in todoItems.enumerate() {
    
    // try to uncomment the line below to see what happens!
    // todoItem.completed = !todoItem.completed
    
    let toggledTodoItem = toggleCompletionForTodoItem(todoItem)
    
    // note that by replacing the todo item at the specified index,
    // you're actually replacing your todoItems array
    // try changing the todoItems array from a var to a let to see what happens!
    todoItems[index] = toggledTodoItem
}

/*:
Double check that all your todoItems are toggled! And remember to thank your friend 😁
*/
todoItems





