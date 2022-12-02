import Foundation

let file = Bundle.main.path(forResource: "input", ofType: "txt")
let input = try String(contentsOfFile: file!)
let lines = input.components(separatedBy: .newlines)

enum Shape {
    case rock
    case paper
    case scissors
    
    init?(input: String) {
        switch input {
        case "A", "X":
            self = .rock
        case "B", "Y":
            self = .paper
        case "C", "Z":
            self = .scissors
        default:
            return nil
        }
    }
    
    var score: Int {
        switch self {
        case .rock:
            return 1
        case .paper:
            return 2
        case .scissors:
            return 3
        }
    }
    
    var losingShape: Shape {
        switch self {
        case .rock:
            return .scissors
        case .paper:
            return .rock
        case .scissors:
            return .paper
        }
    }
    
    var winningShape: Shape {
        switch self {
        case .rock:
            return .paper
        case .paper:
            return .scissors
        case .scissors:
            return .rock
        }
    }
}

func score(opponent: Shape, player: Shape) -> Int {
    let outcome: Int
    switch (opponent, player) {
    case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
        outcome = 3
    case (.rock, .paper), (.paper, .scissors),  (.scissors, .rock):
        outcome = 6
    case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
        outcome = 0
    }
    return outcome + player.score
}


// PART 1
var total1 = 0
lines.forEach { line in
    let moves = line.components(separatedBy: " ")
    guard let opponent = Shape(input: moves[0]), let player = Shape(input: moves[1]) else { return }
    total1 += score(opponent: opponent, player: player)
}
print(total1)

// PART 2
var total2 = 0
lines.forEach { line in
    let input = line.components(separatedBy: " ")
    guard let opponent = Shape(input: input[0]) else { return }
    
    let desiredOutcome = input[1]
    if desiredOutcome == "X" { // lose
        total2 += opponent.losingShape.score
    } else if desiredOutcome == "Y" { // draw
        total2 += opponent.score + 3
    } else if desiredOutcome == "Z" { // win
        total2 += opponent.winningShape.score + 6
    }
}
print(total2)

