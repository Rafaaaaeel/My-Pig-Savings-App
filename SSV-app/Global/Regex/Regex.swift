import Foundation

public enum RegexPatterns: String {
    case onlyCharactersToTen = "^[a-zA-Z]+(\\s[a-zA-Z]+)*$"
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
