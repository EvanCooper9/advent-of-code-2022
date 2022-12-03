import Foundation

struct Day3: Day {
    
    private struct Rudsack {
        let left: String
        let right: String
        var all: String { left + right }
    }
    
    private let rudsacks: [Rudsack] = {
        guard let lines = try? lines(for: "day3") else { return [] }
        return lines.compactMap { line in
            guard !line.isEmpty else { return nil }
            let middleIndex = line.index(line.startIndex, offsetBy: line.count / 2)
            return Rudsack(
                left: String(line.prefix(upTo: middleIndex)),
                right: String(line.suffix(from: middleIndex))
            )
        }
    }()
    
    func question1() -> Any {
        var duplicates = [Character]()
        
        rudsacks.forEach { rudsack in
            let rightSet = Set(rudsack.right.map { $0 })
            var alreadyAdded = Set<Character>()
            for character in rudsack.left {
                if rightSet.contains(character) && !alreadyAdded.contains(character) {
                    duplicates.append(character)
                    alreadyAdded.insert(character)
                }
            }
        }
        
        return duplicates
            .compactMap(\.priority)
            .reduce(0, +)
    }
    
    func question2() -> Any {
        var sum = 0
        for i in stride(from: 0, to: rudsacks.count, by: 3) {
            let first = rudsacks[i].all.bitmask
            let second = rudsacks[i + 1].all.bitmask
            let third = rudsacks[i + 2].all.bitmask
            
            let result = log2(CGFloat(first & second & third))
            sum += Int(result)
        }
        return sum
    }
}

extension Character {
    // 'a' through 'z' == 1 through 26
    // 'A' through 'Z' == 27 through 52
    var priority: Int? {
        guard let asciiValue else { return nil }
        let v = Int(asciiValue)
        if v < 97 { // uppercase
            return v - 65 + 26 + 1
        }
        return v - 97 + 1 // lowercase
    }
    
    var bitmask: Int? {
        guard let priority else { return nil }
        return Int(pow(2.0, Double(priority)))
    }
}

extension String {
    var bitmask: Int {
        reduce(0) { result, character in
            guard let bitmask = character.bitmask else { return result }
            return result | bitmask
        }
    }
}
