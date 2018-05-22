/*
	Given two words (start and end), and a dictionary, find the length of shortest transformation sequence from start to end, such that only one letter can be changed at a time and each intermediate word must exist in the dictionary

	For example, given:
	start = "hit"
	end = "cog"
	dict = ["hot","dot","dog","lot","log"]

	One shortest transformation is "hit" ->"hot" ->"dot" ->"dog" ->"cog", the program should return its length 5.


	SOLUTION: 

	1. add start to a queue. 

	2. take word from queue one by one till size of queue. 

	3. change single letter and if valid word, add it to the next level. 

	4. iterate till queue is empty.. when empty, add the next level to queue.

	5. end when word is found or if queue is empty

*/


// This will be the dictionary of valid words.

extension Array where Element == (String) {
	
	public func transformationDistance(_ from: String, to end: String) -> Int {

		// what if the start word or end is not present in the dictionary?

		var set = Set<String>()
		for item in self {
			set.insert(item)
		}
		
		var queue = Queue<String>()
		queue.enqueue(from)

		var size = queue.size
		var distance = 0;
		while size > 0 {

			guard let word = queue.dequeue() else {
				return distance
			}

			if word == end {
				return distance
			}
			
			let indices = word.indices

			for index in indices {
				var newWord = word

				for char in "abcdefghijklmnopqrstuvwxyz" {

					// ignore the same char
					if word[index] != char {
						let nextIndex = word.index(after: index)
						newWord.replaceSubrange(index..<nextIndex, with: "\(char)")

						// if the word in dictionary, add it to queue
						if set.contains(newWord) {
							queue.enqueue(newWord)
						}
					}
				}
			}

			size -= 1
			if size == 0 {
				size = queue.size
				distance += 1
			}
		}

		return distance
	}
}

struct Queue<T> {
	var items = [T]()
	var index: Int = 0

	public var front: T? {
		return items[index]
	}

	public var size: Int {
		return items.count - index
	}

	public mutating func enqueue(_ item:T ) {
		items.append(item)

		let percentage: Double  = Double(index) / Double(size)
		if size > 50 && percentage > 0.25 {
			items = Array(items[index...])
		}
	}

	public mutating func dequeue() -> T? {
		var item: T? = nil
		if size > 0 {
			item = items[index]
		}
		index += 1
		return item 
	}

	public func getItems() -> [T] {
		return Array(items[index..<size])
	}
}

func test(_ start: String, _ end: String, _ dict: Array<String>) {
	print("\nStart: \(start), End: \(end), Dict:\(dict) => Distance: \(dict.transformationDistance(start, to: end))")
}


test("hit", "cog", ["cog", "hot","dot","dog","lot","log"])