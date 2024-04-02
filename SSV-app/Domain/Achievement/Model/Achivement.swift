import Foundation


internal struct Achievement {
    let total: Decimal
    let saved: Decimal?
    let completes: Int?
    let goals: [Goal]
}

internal struct Goal {
    let total: Decimal
    let saved: Decimal?
    let isOnGoing: Bool
}
