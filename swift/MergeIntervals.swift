#!/usr/bin/swift


public extension Array where Element == (Int, Int) {

	typealias IntervalType = (start: Int, end: Int)
	
	mutating public func merge(_ interval: IntervalType) {
		print("Merging....")
	}

	static func == (lhs: Array<IntervalType>, rhs: Array<IntervalType>) -> Bool {
		guard lhs.count == rhs.count else {
			return false
		}
		for i in 0..<lhs.count {
			if (lhs[i].start != rhs[i].start || lhs[i].end != rhs[i].end) {
				return false
			}
		}
		return true
	}
}

// ---------------------- TEST EQUALITY ---------------------- 

typealias IntervalType = (start: Int, end: Int)

func isEqual(_ arr1: [IntervalType], _ arr2: [IntervalType], _ result: Bool) {
	
	print("Equality test \((arr1 == arr2) == result ? "Success": "Failed")")
	
}

isEqual([(1, 2), (3, 4)], [(1, 2), (3, 4)], true)
isEqual([(1, 2), (3, 4)], [(1, 2), (3, 5)], false)
isEqual([(1, 2), (3, 4)], [(1, 2)], false)


func test(_ array: Array<(Int, Int)>, _ interval: (Int, Int), _ result: Array<(Int, Int)>) {
	var mutableArray = array
	mutableArray.merge(interval)
	print("Test \(mutableArray == result ? "Successful": "Failed")")
}

test([(1, 2), (3, 4)], (5, 6), [(1, 2), (3, 4), (5, 6)])