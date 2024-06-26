import Foundation

public enum RegexPatterns: String {
    case onlyCharactersToTen = "^[a-zA-Z\\s]{0,9}[a-zA-Z]$"
    case onlyToSixTeenNumbers = "^.{0,16}$"
}


public struct Regex {
    
    static func validate(input: String, _ pattern: RegexPatterns) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: pattern.rawValue)
            let range = NSRange(location: 0, length: input.utf16.count)
            return regex.firstMatch(in: input, range: range) != nil
        } catch {
            return false
        }
        
    }
    
}
