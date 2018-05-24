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

		let total = (count + array.count)

		// GUARD: Both array empty -> No result
		guard total > 0 else {
			return -1
		}

		// GUARD: If self is empty, take the median of given array
		guard count > 0 else {
			return array.median
		}

		// GUARD: If given array is empty, take the median of self
		guard array.count > 0 else {
			return self.median
		}
		
		// NON OVERLAPPING -> median
		
		if self.last! < array.first! { 

			// SELF then Array => O(1)

			return nonOverlappingMedian(self, array)


		} else if array.last! < self.first! {

			// Array then SELF => O(1)

			return nonOverlappingMedian(array, self)

		} else { 

			// OVERLAPPING

			return 1.9

		}

	}

	private func nonOverlappingMedian(_ array1: Array<Int>, _ array2: Array<Int>) -> Double {
		
		let total = array1.count + array2.count
		let index = total/2

		if total%2 != 0 { // ODD
			if index < array1.count {
				return Double(array1[index])
			} else {
				return Double(array2[index - array1.count])
			}
		} else { // EVEN
			
			if index + 1 < array1.count {
				return Double(array1[index] + array1[index+1])/2.0
			} else if index >= array1.count {
				return Double(array2[index-array1.count] + array2[1+index-array1.count])/2.0
			} else {
				return Double(array1[index] + array2[1+index-array1.count])/2.0
			}
		}
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
	print(array1.medianOf(array2))
	genTest("Median of 2 Arrays") { array1.medianOf(array2) == result }
}

// only one array
test([], [5, 6, 7], 6.0)
test([1, 5, 9], [], 5.0)

// non overlapping
test([1, 2, 3, 4], [5], 3.0)
test([1], [5, 6, 7, 8], 6.0)
test([1, 2, 3, 4], [5, 6, 7], 4.0)
test([1, 20, 30], [50, 60, 70, 88], 50.0)
