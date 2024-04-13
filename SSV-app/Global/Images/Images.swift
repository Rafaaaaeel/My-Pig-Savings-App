import UIKit

public struct Images {
    
    struct App {
        static var close = UIImage(systemName: "xmark")?
                                                    .withTintColor(ColorTheme.gray,
                                                   renderingMode: .alwaysOriginal)
        static var arrow_left = UIImage(systemName: "arrow.left")?
                                                    .withTintColor(ColorTheme.gray,
                                                   renderingMode: .alwaysOriginal)
        static var plus_green = UIImage(systemName: "plus")?
                                                    .withTintColor(ColorTheme.secondaryTile,
                                                   renderingMode: .alwaysOriginal)
        static var plus_gray = UIImage(systemName: "plus")?
                                                    .withTintColor(ColorTheme.gray,
                                                   renderingMode: .alwaysOriginal)
        static var minus = UIImage(systemName: "minus")?
                                                    .withTintColor(.systemRed,
                                                   renderingMode: .alwaysOriginal)
    }
    
    struct Intro {
        static var thoughts = UIImage(named: "thoughts")
    }
    
    struct Home {
        static var pig_savig = UIImage(named: "savings")
        static var person_fill = UIImage(systemName: "person.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large) )?.withTintColor(ColorTheme.primaryTitle,
                                                                    renderingMode: .alwaysOriginal)
    }
    
    struct Creation {
        static var bar = UIImage(named: "bar")
    }
    
    struct Card {
        static var plants = UIImage(named: "plants")
    }
    
}
