public extension Optional where Wrapped == Bool {
    
    var orFalse: Bool {
        return self ?? false
    }
    
    var orTrue: Bool {
        return self ?? true
    }
    
}
