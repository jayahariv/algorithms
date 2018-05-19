//: Playground - noun: a place where people can play

import UIKit

extension Array {
    
    // O(n) - Performance
    // O(n) - Memory
    func rightRotateNaive(_ noOfTimes: Int) -> [Element] {
        var items = [Element]()
        let times = noOfTimes % count + 1 // since the times is different from index
        var index = times
        while index < count {
            items.append(self[index])
            index += 1
        }
        index = 0
        while index < times {
            items.append(self[index])
            index += 1
        }
        return items
    }
}

let input = [1, 2, 3, 4, 5]
let result = input.rightRotateNaive(2)
