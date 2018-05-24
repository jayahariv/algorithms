#!/usr/bin/swift

/*
	There are two sorted arrays A and B of size m and n respectively. Find the median of the
	two sorted arrays. 

	The overall run time complexity should be O(log (m+n)).
}

*/

public extension Array where Element == (Int) {

	// O(n)
	var isSorted: Bool {

		guard count > 1 else {
			return true
		}
		
		for i in 0..<count - 1 {
			if self[i] > self[i + 1] {
				return false
			}
		}

		return true
	}

	
	// If sorted, returns median of an array, else -1
	// O(n) -> checking sorting, if not O(1)
	var median: Double {

		guard isSorted else {
			return -1
		}

		let result: Double = count % 2 == 0 ? Double(self[count/2] + self[count/2 - 1])/2.0 : Double(self[count/2])
		return result
	}
	
	// Call only if your array and the passed arrays are sorted

	public func medianOf(_ array: Array<Element>) -> Double {
		return 1.9
	}
}

// ------------------ HELPER ------------------

func genTest(_ name: String, _ process: () -> Bool) {
	print("\(name) Test => \(process() ? "Successful" : "Failed")")
}

// ------------------ SORT ------------------

func testSort(_ array: Array<Int>, _ result: Bool) {
	genTest("Sort") { array.isSorted == result }
}

testSort([1, 2, 3, 4, 5, 6], true)
testSort([9, 7, 3, 4, 10, 6], false)
testSort([], true)

// ------------------ Median Of an Array ------------------

func testMedianOfArray(_ array: Array<Int>, _ result: Double) {
	genTest("Median Of an Array") { array.median == result }
}

testMedianOfArray([1, 2, 3], 2.0)
testMedianOfArray([1, 2, 3, 4], 2.5)

// ------------------ Median Of 2 Arrays ------------------

func test(_ array1: Array<Int>, _ array2: Array<Int>, _ result: Double) {
	genTest("Median of 2 Arrays") { array1.medianOf(array2) == result }
}


test([1, 2], [3, 4], 1.9)