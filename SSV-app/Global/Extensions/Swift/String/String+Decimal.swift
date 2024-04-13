import Foundation


public extension String {
    
    var toDecimal: Decimal {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR") // Defina a localização para o Brasil para garantir o formato correto
        
        if let number = formatter.number(from: self) {
            let decimalString = number.decimalValue
            return decimalString
        } else {
            // Se a conversão falhar, retorne nil
            return 0
        }
    }
    
}

