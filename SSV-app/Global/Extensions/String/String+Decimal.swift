import Foundation


public extension String {
    
    var toDecimal: Decimal {
        return Decimal(string: self) ?? 0
    }
    
}

