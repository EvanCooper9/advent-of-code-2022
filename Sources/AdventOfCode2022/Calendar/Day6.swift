struct Day6: Day {
    
    private let message: String = { lines(for: "day6").first! }()
    
    func question1() -> Any {
        indexOfMarker(ofLength: 4)
    }
    
    func question2() -> Any {
        indexOfMarker(ofLength: 14)
    }
    
    private func indexOfMarker(ofLength length: Int) -> Int {
        for i in (length - 1)..<message.count {
            let start = i - (length - 1)
            if Set(message[start...i].map { $0 }).count == length { return i + 1 }
        }
        return -1
    }
}
