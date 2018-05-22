#!/usr/bin/swift

/*
	Given two strings s and t, determine if they are isomorphic. Two strings are isomorphic
	if the characters in s can be replaced to get t.

	For example,"egg" and "add" are isomorphic, "foo" and "bar" are not.
*/


extension String {
	
	func isIsomorphic(_ anotherString: String) -> Bool {
		var map = [String: Character]()

		let isSelfLargeCount = self.count > anotherString.count
		let largestWord = isSelfLargeCount ? self : anotherString

		for ind in largestWord.indices {
			let myChar = self[ind]
			let anotherChar = anotherString[ind]
			let key = "\(myChar)"
			let valueKey = "\(anotherChar)~"

			if map[key] != nil || map[valueKey] != nil {
				guard map[key] == anotherChar || map[valueKey] == myChar else {
					return false
				}
			} else {
				map[key] = anotherChar
				map[valueKey] = myChar
			}
		}

		return true
	}
}

func test(_ a: String, _ b: String) {
	print("Testing Isomorphism ( \(a),  \(b) ) => \(a.isIsomorphic(b) ? "Yes" : "No")")
}

test("egg", "add")

test("foo", "bar")

test("paper", "title")

test("ab", "aa")