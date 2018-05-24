#!/usr/bin/swift

func shiftedDiff(_ s1: String, _ s2: String) -> Int? {

  guard s1.asciiSum() == s2.asciiSum() else {
    return nil
  }
  
  guard s1.unicodeScalars.count == s2.unicodeScalars.count else {
    return nil
  }

  guard s1 != s2 else {
  	return 0
  }
  
  var editableS1 = s1
  for i in 0..<s1.unicodeScalars.count {
  	editableS1.rotate()
  	if editableS1 == s2 {
  		return i + 1
  	}
  }
  
  return nil
}

extension String {
  func asciiSum() -> Int {
    return unicodeScalars.reduce(0, {x, y in 
      return x + Int(y.value)
    })
  }
  
  // New string will be replaced with existing: O(n)
  mutating func rotate() {
    let temp = self[self.index(before: endIndex)]
    self = String(temp) + self[startIndex..<self.index(before: endIndex)]
  }
}


func test(_ a: String, _ b: String) {
	print("Input: ( \(a) , \(b) ) => \(shiftedDiff(a , b) ?? -1)")
}

test("moose", "Moose")
test("coffee","eecoff")
test("eecoff","coffee")
test("isn't","'tisn")
test("Esham","Esham")
test("dog","god")