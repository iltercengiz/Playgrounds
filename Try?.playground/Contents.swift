//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func throwing() throws -> Int {
    throw NSError(domain: "asdasd", code: 4, userInfo: nil)
//    return 5
}

func test() {
    guard let number = try? throwing() else {
        print("Failed")
        return
    }
    print(number)
}
test()
