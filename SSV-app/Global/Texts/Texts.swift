public struct Texts {

    public struct Card {
        static let TOTAL = "Goal"
        static let SAVED = "Saved"
        static let ZERO_MONEY = "R$ 0,00"
        static let ZERO_PERCENTAGE = "0%"
        static let NAME = "Name"
    }
    
    public struct Intro {
        static let NAME = "Name"
        static let GET_STARTED = "Get Started"
        static let QUESTION = "How would you like to be called?"
        static let ERROR_MESSAGE = "Please enter only letters"
    }
    
    public struct Home {
        static let NEW_GOAL = "NEW GOAL"
        static let ACHIEVEMENT = "ACHIEVEMENT"
        static let HELLO = "Hello,"
        static let GOALS = "MY GOALS"
    }
    
    public struct Creation {
        static let LETS_DO_IT = "Let's do it"
        static let SAVE = "Save"
        static let NAME = "Name"
        static let VALUE = "R$ 0,00"
    }
    
    public struct Goals {
        static let TITLE = "Your goals"
    }
    
    public struct Details {
        static let TITLE = "You have reached"
        static let OF_YOUR = "of your"
        static let SAVINGS = "saving goal"
        static let SPACE = " "
        
        static func SUBTITLE(_ input: String) -> String { OF_YOUR + SPACE + input + SPACE + SAVINGS }
    }
    
}
