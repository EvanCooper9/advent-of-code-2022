import Foundation

func lines(for filename: String) throws -> [String] {
    guard let file = Bundle.module.path(forResource: filename, ofType: "txt") else { return [] }
    let input = try String(contentsOfFile: file)
    return input.components(separatedBy: .newlines)
}
