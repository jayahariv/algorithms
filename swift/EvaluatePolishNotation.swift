#!/usr/bin/swift

/*
	Evaluate the value of an arithmetic expression in Reverse Polish Notation. Valid
	operators are +, -, *, /. Each operand may be an integer or another expression

	// I
	1, 2, + => 1 + 2 = 3
	
	// II
	1, 2, +, 4, * => (1 + 2) * 4 = 12

	// III
	1, 2, +, 5, 1, *, + => (1 + 2) + (5 * 1) = 8

	// IV
	1, 2, 3, +, * => 1 * (2 + 3) = 5

*/

// Helper string methods
extension String {
	var isInt: Bool {
		return Int(self) != nil
	}

	var isOperator: Bool {
		return self == "+" || self == "-" || self == "*" || self == "/"
	}
}

// basic stack 
struct Stack<T> {
	var items = [T]()

	mutating func push(_ item: T) {
		items.append(item)
	}

	mutating func pop() -> T? {
		return items.removeLast()
	}

	func last() -> T? {
		return items.last
	}
}


extension Array where Element == (String) {
	
	func evaluate() -> Int? {

		var stack = Stack<Int>()

		for item in self {

			if item.isInt, let value = Int(item) {

				stack.push(value)

			} else if item.isOperator, let op1 = stack.pop(), let op2 = stack.pop() {

				switch item {
					case "+": stack.push(op1 + op2)
					case "-": stack.push(op1 - op2)
					case "*": stack.push(op1 * op2)
					case "/": stack.push(op1 / op2)
					default: return nil
				}

			} else {

				return nil
			}
		}

		return stack.pop()
	}
}

let input = ["1", "2", "+"]
print("Evaluating \(input) and result is: \(input.evaluate() ?? -1001)")

let input2 = ["1", "2", "+", "4", "*"]
print("Evaluating \(input2) and result is: \(input2.evaluate() ?? -1001)")

let input3 = ["1", "2", "+", "5", "1", "*", "+"]
print("Evaluating \(input3) and result is: \(input3.evaluate() ?? -1001)")

let input4 = ["1", "2", "3", "+", "*"]
print("Evaluating \(input4) and result is: \(input4.evaluate() ?? -1001)")


// ----------------------- Pass Evaluate Closure -----------------------------

extension Array {
	func evaluate() -> Int? {
		var stack = Stack<Int>()
		for item in self {
			if let item = item as? String, item.isInt, let value = Int(item) {
				stack.push(value)
			} else {
				if let op1 = stack.pop(), let op2 = stack.pop(), let fun = (item as? (Int, Int) -> Int) {
					stack.push(fun(op2, op1))
				}
			}
		}
		return stack.pop()
	}
}
let addition = { (a: Int, b: Int) -> Int in 
	return (2 * a) + b
};
let inputValues1:[Any] = ["3", "2", addition]
print("Evaluating \(inputValues1) and result is: \(inputValues1.evaluate() ?? -10001)")
