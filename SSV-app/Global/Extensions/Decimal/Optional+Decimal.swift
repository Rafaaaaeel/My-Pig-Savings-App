import Foundation

public extension Optional where Wrapped == Decimal {
    
    var orEmpty: Decimal {
        return self ?? Decimal()
    }
    
}
