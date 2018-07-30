//: Playground - noun: a place where people can play

import Foundation

// First, we create a group to synchronize our tasks
let group = DispatchGroup()

typealias handler = ((String) -> Void)

func load(text: String,_ handler: handler) {
    print(text)
    handler(text)
}

// NoteCollection is a thread-safe collection class for storing notes
var collection = [String]()

// The 'enter' method increments the group's task count…
group.enter()

load(text: "abc") { (text) in
    collection.append(text)
    group.leave()
}



group.enter()
load(text: "123") { (text) in
    collection.append(text)
    group.leave()
}

group.enter()
load(text: "456") { (text) in
    collection.append(text)
    group.leave()
}

// This closure will be called when the group's task count reaches 0
group.notify(queue: .main) {
    print("completed")
}
