//: Playground - noun: a place where people can play

import UIKit
import Foundation
import XCPlayground

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

let url = NSURL(string: "https://api.foursquare.com/v2/venues/40a55d80f964a52020f31ee3")
let session = NSURLSession.sharedSession()
if let url = url {
    let request = NSMutableURLRequest(URL: url)
    request.HTTPMethod = "GET"
    request.setValue("XCPlayground-Test", forHTTPHeaderField: "XCPlayground-Field")
//    let body = [
//        "id": 123
//    ]
//    do {
//        request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(body, options: NSJSONWritingOptions(rawValue: 0))
//    } catch {
//        // Handle error
//    }
    let task = session.dataTaskWithRequest(request) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
        defer {
            XCPlaygroundPage.currentPage.finishExecution()
        }
        print(data)
        print(error?.localizedDescription)
        if let data = data {
            print(String(data: data, encoding: NSUTF8StringEncoding))
            do {
                let response = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(rawValue: 0))
            } catch {
                // Handle error
            }
        }
    }
    task.resume()
}
