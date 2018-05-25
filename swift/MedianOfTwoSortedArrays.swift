#!/usr/bin/swift

/*
	There are two sorted arrays A and B of size m and n respectively. Find the median of the
	two sorted arrays. 

	The overall run time complexity should be O(log(min(m,n))).
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

		// GUARD: If both array medians are same, return one among them.
		guard self.median != array.median else {
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

			return overlappingMedian(self, array)
		}

	}

	private func nonOverlappingMedian(_ array1: Array<Int>, _ array2: Array<Int>) -> Double {
		
		let total = array1.count + array2.count
		let position = (total + 1 )/2

		if total%2 != 0 { // ODD
			
			if position <= array1.count {
				
				return Double(array1[position - 1])

			} else {
				
				return Double(array2[position - array1.count - 1])

			}
		
		} else { // EVEN
			
			if array1.count - position > 0 {

				return Double(array1[position - 1] + array1[position])/2.0

			} else if position - array1.count > 0 {
				
				return Double(array2[position-array1.count - 1] + array2[position-array1.count])/2.0

			} else {
				
				return Double(array1[position - 1] + array2[position-array1.count])/2.0

			}
		}
	}

	private func overlappingMedian(_ array1: Array<Int>, _ array2: Array<Int>) -> Double {

		// Make sure, array 1 always has the minimum length.
		if array1.count > array2.count {
			return overlappingMedian(array2, array1)
		}

		let x = array1.count
		let y = array2.count

		var low = 0
		var high = x

		while low <= high {
			
			let partitionX = (low+high)/2
			let partitionY = (x+y+1)/2 - partitionX

			let maxLeftX = partitionX <= 0 ? Int(Int32.min) : array1[partitionX - 1]
			let minRightX = partitionX >= x ? Int(Int32.max) : array1[partitionX]
			
			let maxLeftY = partitionY <= 0 ? Int(Int32.min) : array2[partitionY - 1]
			let minRightY = partitionY >= y ? Int(Int32.max) : array2[partitionY]

			if maxLeftX <= minRightY && maxLeftY <= minRightX {

				if ((x+y)%2) == 0 {
					return Double( Swift.max(maxLeftX, maxLeftY) + Swift.min(minRightX, minRightY) ) / 2.0

				} else {

					return Double(Swift.max(maxLeftX, maxLeftY))

				}
			} else if maxLeftX > minRightY {
				
				high = partitionX - 1
			
			} else  {
				
				low = partitionX + 1
			}
		}

		return Double(Int32.min)
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

// only one array
test([], [5, 6, 7], 6.0)
test([1, 5, 9], [], 5.0)

// non overlapping
test([1, 2, 3, 4], [5], 3.0)
test([1], [5, 6, 7, 8], 6.0)
test([1, 2, 3, 4], [5, 6, 7], 4.0)
test([1, 20, 30], [50, 60, 70, 88], 50.0)
test([1, 20, 30, 40, 50], [60, 70, 88], 45.0)
test([1, 20, 30], [60, 70, 88, 90, 110], 65.0)
test([1, 20, 30], [60, 70, 88], 45.0)
test([1, 2, 4, 7, 9, 10], [2, 4, 6, 8, 9], 6.0)

// leetcode tests - 2080
test([1, 3], [2], 2.0)
test([1], [1], 1.0)
test([1,1], [1,2], 1.0) // 1670
test([2], [1, 3, 4], 2.5) // 1676
