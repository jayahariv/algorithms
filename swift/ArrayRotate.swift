#!/usr/bin/swift

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
    
    /*
     1, 2, 3, 4, 5
     bubble up the last item
     => 1, 2, 3, 5, 4
     => 1, 2, 5, 3, 4
     => 1, 5, 2, 3, 4
     => 5, 1, 2, 3, 4
     
     do the bubbling up noOfTimes you wanted!
     for example, 3 times. you will end up getting
     => 3, 4, 5, 1, 2
     */
    mutating func rightRotateBubble(_ noOfTimes: Int) {
        
        for _ in 1...noOfTimes {
            for i in stride(from: self.count - 1, to: 0, by: -1) {
                let temp = self[i]
                self[i] = self[i - 1]
                self[i - 1] = temp
            }
        }
    }
}

let input = [1, 2, 3, 4, 5]
let resultNaive = input.rightRotateNaive(2)
print(resultNaive)

var inputBubble = [1, 2, 3, 4, 5]
inputBubble.rightRotateBubble(2)
print(inputBubble)
