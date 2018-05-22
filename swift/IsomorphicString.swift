#!/usr/bin/swift

/*
	Given two strings s and t, determine if they are isomorphic. Two strings are isomorphic
	if the characters in s can be replaced to get t.

	For example,"egg" and "add" are isomorphic, "foo" and "bar" are not.
*/


extension String {
	
	func isIsomorphic(_ anotherString: String) -> Bool {
		var map = [Character: Character]()

		let isSelfLargeCount = self.count > anotherString.count
		let largestWord = isSelfLargeCount ? self : anotherString

		for ind in largestWord.indices {
			let myChar = self[ind]
			let anotherChar = anotherString[ind]

			if map[myChar] != nil {
				guard map[myChar] == anotherChar else {
					return false
				}
			} else {
				map[myChar] = anotherChar
			}
		}

		return true
	}
}


let a = "egg"
let b = "add"
print("Testing Isomorphism ( \(a),  \(b) ) => \(a.isIsomorphic(b) ? "Yes" : "No")")

let a1 = "foo"
let b1 = "bar"
print("Testing Isomorphism ( \(a1),  \(b1) ) => \(a1.isIsomorphic(b1) ? "Yes" : "No")")
