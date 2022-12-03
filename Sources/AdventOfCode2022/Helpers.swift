import Foundation

func lines(for filename: String) -> [String] {
    guard let file = Bundle.module.path(forResource: filename, ofType: "txt") else { return [] }
    guard let input = try? String(contentsOfFile: file) else { return [] }
    return input.components(separatedBy: .newlines)
}
