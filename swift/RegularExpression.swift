#!/usr/bin/swift

/*
	Implement regular expression matching with support for ’.’ and ’*’.

	’.’ Matches any single character. ’*’ Matches zero or more of the preceding element.

	The matching should cover the entire input string (not partial).
	
	Some examples: 

	isMatch("aa","a") return false 
	isMatch("aa","aa") return true 
	isMatch("aaa","aa") return false 
	isMatch("aa", "a*") return true 
	isMatch("aa", ".*") return true 
	isMatch("ab", ".*") return true 
	isMatch("aab", "c*a*b") return true


	NOTE: Holding it till I finish with all easy questions.
	
*/

public extension String {
	
	public func isRegexMatching(_ pattern: String) -> Bool {
		return true
	}
}


// ------------------------ TESTS ----------------------- 

func test(_ s: String, _ p: String, _ r: Bool) {
	print("Test \(s) \(p) => \(s.isRegexMatching(p) == r ? "Successful" : "Failed") ")
}

test("aaa", "*a", true)