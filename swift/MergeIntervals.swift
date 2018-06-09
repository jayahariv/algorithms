#!/usr/bin/swift

struct Interval: Equatable {
	let start: Int!
	let end: Int!

	static func == (lhs: Interval, rhs: Interval) -> Bool {
		if (lhs.start != rhs.start || lhs.end != rhs.end) {
			return false
		}
		return true
	}
}


extension Array where Element == Interval {
	mutating func merge() {

		guard count > 0 else {
			return
		}

		var result = [Interval]()
		
		self.sort() { $0.start < $1.start }

		var previousInterval = self.first!

		for i in 1..<count {
			
			let currentInterval = self[i]

			if previousInterval.end >= currentInterval.start {
				previousInterval = Interval(start: previousInterval.start, end: Swift.max(previousInterval.end, currentInterval.end))
			} else {
				result.append(previousInterval)
				previousInterval = currentInterval
			}

		}

		result.append(previousInterval)
		
		self = result
	}

	func print() {
		for e in self {
			Swift.print("start: \(e.start) end: \(e.end)")
		}
	}
}

// ---------------------- TEST EQUALITY ---------------------- 

// typealias IntervalType = (start: Int, end: Int)

func isEqual(_ arr1: [Interval], _ arr2: [Interval], _ result: Bool) {
	
	print("Equality test \((arr1 == arr2) == result ? "Success": "Failed")")
	
}

isEqual([Interval(start: 1, end: 2), Interval(start: 3, end: 4)], [Interval(start: 1, end: 2), Interval(start: 3, end: 4)], true)
isEqual([Interval(start: 1, end: 2), Interval(start: 3, end: 4)], [Interval(start: 1, end: 2), Interval(start: 3, end: 5)], false)
isEqual([Interval(start: 1, end: 2), Interval(start: 3, end: 4)], [Interval(start: 1, end: 2)], false)


func test(_ array: Array<Interval>, _ result: Array<Interval>) {
	var mArray = array
	mArray.merge()
	print("Test \(mArray == result ? "Successful": "Failed")")
}

test([Interval(start: 1, end: 2), Interval(start: 3, end: 4)], [Interval(start: 1, end: 2), Interval(start: 3, end: 4)])
test([Interval(start: 1, end: 3), Interval(start: 3, end: 4)], [Interval(start: 1, end: 4)])
test([Interval(start: 1, end: 3), Interval(start: 3, end: 6), Interval(start: 2, end: 3), Interval(start: 7, end: 10)], [Interval(start: 1, end: 6), Interval(start: 7, end: 10)])

test([], [])

// 169 / 169 test cases passed. LeetCode 6/9/2019
