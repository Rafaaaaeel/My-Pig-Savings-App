import UIKit

public struct Images {
    
    struct App {
        static var close = UIImage(systemName: "xmark")?
                                    .withTintColor(ColorTheme.secondaryTile,
                                                   renderingMode: .alwaysOriginal)
        static var arrow_left = UIImage(systemName: "arrow.left")?
                                    .withTintColor(ColorTheme.secondaryTile,
                                                   renderingMode: .alwaysOriginal)
    }
    
    struct Intro {
        static var thoughts = UIImage(named: "thoughts")
    }
    
    struct Home {
        static var pig_savig = UIImage(named: "savings")
    }
    
    struct Creation {
        static var bar = UIImage(named: "bar")
    }
    
    struct Card {
        static var plants = UIImage(named: "plants")
    }
    
}
