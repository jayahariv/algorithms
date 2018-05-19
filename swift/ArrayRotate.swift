#!/usr/bin/swift

enum RotateSide {
    case right;
    case left;
}

extension Array {
    
    // O(n) - Performance
    // O(n) - Memory
    func rotateNaive(_ noOfTimes: Int, side: RotateSide) -> [Element] {
        var items = [Element]()
        let times = noOfTimes % count
        
        
        let position = 
            side == RotateSide.right
                ? count - times // if noOfTimes is 2 and count is 6, thats means first element will become 6-2 = 4th index item and so on.
                : times // if noOfTimes is 2, first element will be in 2nd position item nd so on. 
        
        // After finishing position to End of array appending, add the remaining items from 0 index to position where we started. 

        var index = position

        while index < count {
            items.append(self[index])
            index += 1
        }
        index = 0
        while index < position {
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
    mutating func rotateBubble(_ noOfTimes: Int, side: RotateSide) {
        let list = 
            side == RotateSide.right 
                ? stride(from: self.count - 1, to: 0, by: -1) 
                : stride(from: 1, to: self.count, by: 1)
        for _ in 1...noOfTimes {
            for i in list {
                let temp = self[i]
                self[i] = self[i - 1]
                self[i - 1] = temp
            }
        }
    }

    mutating func rotateReversal(_ noOfTimes: Int, side: RotateSide) {
        let position = 
            side == RotateSide.right 
                ? noOfTimes
                : count - noOfTimes
        reverse(0, end: position - 1)
        reverse(position, end: count - 1)
        reverse(0, end: count - 1)
    }

    mutating func reverse(_ start: Int, end: Int) {
        var start = start
        var end = end
        while start < end {
            let temp = self[start]
            self[start] = self[end]
            self[end] = temp
            start += 1
            end -= 1
        }
    }
}

print("\nNaive Rotation")
let input = [1, 2, 3, 4, 5, 6]
let rightResultNaive = input.rotateNaive(2, side: .right)
print("Input is: \(input) Result after Right Rotation of 2 times is: \(rightResultNaive) ")
let leftResultNaive = input.rotateNaive(2, side: .left)
print("Input is: \(input) Result after Left Rotation of 2 times is: \(leftResultNaive) ")

print("\nBubble Rotation")
var inputBubble = [1, 2, 3, 4, 5, 6, 7, 8]
let inputBubbleInput1 = inputBubble
inputBubble.rotateBubble(3, side: .right)
print("Input is: \(inputBubbleInput1) Result after Right Bubble Rotation of 3 times is: \(inputBubble) ")
let inputBubbleInput2 = inputBubble
inputBubble.rotateBubble(2, side: .left)
print("Input is: \(inputBubbleInput2) Result after Left Bubble Rotation of 2 times is: \(inputBubble) ")

print("\nReversal Rotation")
var inputReversal = [1, 2, 3, 4, 5, 6, 7, 8, 9]
let inputReversalInput = inputReversal
inputReversal.rotateReversal(3, side: .right)
print("Input is: \(inputReversalInput) Result after Right Rotation of 3 times is: \(inputReversal) ")
let inputReversalInput2 = inputReversal
inputReversal.rotateReversal(2, side: .left)
print("Input is: \(inputReversalInput2) Result after Left Rotation of 2 times is: \(inputReversal) ")