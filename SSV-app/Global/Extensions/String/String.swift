public extension String {
    
    static var empty: String {
        return ""
    }
    
    var isNotEmpty: Bool {
        return !self.isEmpty
    }
    
}
