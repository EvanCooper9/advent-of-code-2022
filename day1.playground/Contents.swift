import Foundation

let file = Bundle.main.path(forResource: "input", ofType: "txt")
let input = try String(contentsOfFile: file!)
let lines = input.components(separatedBy: .newlines)

var current = 0
var elves = [Int]()

lines.forEach { line in
    guard !line.isEmpty else {
        elves.append(current)
        current = 0
        return
    }
    guard let calories = Int(line) else { return }
    current += calories
}

elves.sort()

let range = (elves.count - 3)..<elves.count
elves[range].reduce(0, +)
