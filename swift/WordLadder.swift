#!/usr/bin/swift
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

	NB: COMPLETE ASSUMPTION OF ONLY UTF8

*/

extension String {
	
	// if you want to only check for next items in the dictionary
	func isBefore(_ string: String) -> Bool {
		return self < string
	}
}


// This will be the dictionary of valid words.

extension Array where Element == (String) {
	
	public func transformationDistance(_ from: String, to end: String) -> Int {

		// what if the start word or end is not present in the dictionary?

		var set = Set<String>()
		for item in self {
			set.insert(item)
		}

		// GUARD: Make sure, start and end is not equal
		guard from != end else {
			return 1
		}

		// GUARD: Make sure end is in the dictionary
		guard set.contains(end) else {
			return 0
		}
		
		var queue = Queue<String>()
		queue.enqueue(from)

		var size = queue.size
		var distance = 1;
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

					if word[index] != char {
						let nextIndex = word.index(after: index)
						newWord.replaceSubrange(index..<nextIndex, with: "\(char)")
						// if the word in dictionary, add it to queue
						if set.contains(newWord) {
							queue.enqueue(newWord)
							set.remove(newWord)
						}
					}
				}
			}

			// GUARD: When no next elements found, its end
			guard queue.size != 0 else {
				return 0;
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
		return Array(items[index..<items.count])
	}
}

func test(_ start: String, _ end: String, _ dict: Array<String>, _ result: Int) {
	print("Test => \(dict.transformationDistance(start, to: end) == result ? "Successful": "Failed")")
}

test("hot", "dog", ["hot","dog"], 0)
test("hit", "cog", ["cog", "hot","dot","dog","lot","log"], 5)
test("hit", "cog", ["hot","dot","dog","lot","log"], 0)
test("cet", "ism", ["kid","tag","pup","ail","tun","woo","erg","luz","brr","gay","sip","kay","per","val","mes","ohs","now","boa","cet","pal","bar","die","war","hay","eco","pub","lob","rue","fry","lit","rex","jan","cot","bid","ali","pay","col","gum","ger","row","won","dan","rum","fad","tut","sag","yip","sui","ark","has","zip","fez","own","ump","dis","ads","max","jaw","out","btu","ana","gap","cry","led","abe","box","ore","pig","fie","toy","fat","cal","lie","noh","sew","ono","tam","flu","mgm","ply","awe","pry","tit","tie","yet","too","tax","jim","san","pan","map","ski","ova","wed","non","wac","nut","why","bye","lye","oct","old","fin","feb","chi","sap","owl","log","tod","dot","bow","fob","for","joe","ivy","fan","age","fax","hip","jib","mel","hus","sob","ifs","tab","ara","dab","jag","jar","arm","lot","tom","sax","tex","yum","pei","wen","wry","ire","irk","far","mew","wit","doe","gas","rte","ian","pot","ask","wag","hag","amy","nag","ron","soy","gin","don","tug","fay","vic","boo","nam","ave","buy","sop","but","orb","fen","paw","his","sub","bob","yea","oft","inn","rod","yam","pew","web","hod","hun","gyp","wei","wis","rob","gad","pie","mon","dog","bib","rub","ere","dig","era","cat","fox","bee","mod","day","apr","vie","nev","jam","pam","new","aye","ani","and","ibm","yap","can","pyx","tar","kin","fog","hum","pip","cup","dye","lyx","jog","nun","par","wan","fey","bus","oak","bad","ats","set","qom","vat","eat","pus","rev","axe","ion","six","ila","lao","mom","mas","pro","few","opt","poe","art","ash","oar","cap","lop","may","shy","rid","bat","sum","rim","fee","bmw","sky","maj","hue","thy","ava","rap","den","fla","auk","cox","ibo","hey","saw","vim","sec","ltd","you","its","tat","dew","eva","tog","ram","let","see","zit","maw","nix","ate","gig","rep","owe","ind","hog","eve","sam","zoo","any","dow","cod","bed","vet","ham","sis","hex","via","fir","nod","mao","aug","mum","hoe","bah","hal","keg","hew","zed","tow","gog","ass","dem","who","bet","gos","son","ear","spy","kit","boy","due","sen","oaf","mix","hep","fur","ada","bin","nil","mia","ewe","hit","fix","sad","rib","eye","hop","haw","wax","mid","tad","ken","wad","rye","pap","bog","gut","ito","woe","our","ado","sin","mad","ray","hon","roy","dip","hen","iva","lug","asp","hui","yak","bay","poi","yep","bun","try","lad","elm","nat","wyo","gym","dug","toe","dee","wig","sly","rip","geo","cog","pas","zen","odd","nan","lay","pod","fit","hem","joy","bum","rio","yon","dec","leg","put","sue","dim","pet","yaw","nub","bit","bur","sid","sun","oil","red","doc","moe","caw","eel","dix","cub","end","gem","off","yew","hug","pop","tub","sgt","lid","pun","ton","sol","din","yup","jab","pea","bug","gag","mil","jig","hub","low","did","tin","get","gte","sox","lei","mig","fig","lon","use","ban","flo","nov","jut","bag","mir","sty","lap","two","ins","con","ant","net","tux","ode","stu","mug","cad","nap","gun","fop","tot","sow","sal","sic","ted","wot","del","imp","cob","way","ann","tan","mci","job","wet","ism","err","him","all","pad","hah","hie","aim","ike","jed","ego","mac","baa","min","com","ill","was","cab","ago","ina","big","ilk","gal","tap","duh","ola","ran","lab","top","gob","hot","ora","tia","kip","han","met","hut","she","sac","fed","goo","tee","ell","not","act","gil","rut","ala","ape","rig","cid","god","duo","lin","aid","gel","awl","lag","elf","liz","ref","aha","fib","oho","tho","her","nor","ace","adz","fun","ned","coo","win","tao","coy","van","man","pit","guy","foe","hid","mai","sup","jay","hob","mow","jot","are","pol","arc","lax","aft","alb","len","air","pug","pox","vow","got","meg","zoe","amp","ale","bud","gee","pin","dun","pat","ten","mob"], 11)