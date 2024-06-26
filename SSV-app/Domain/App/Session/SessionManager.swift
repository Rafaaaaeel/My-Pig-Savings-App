import Foundation


public protocol SessionManagerProtocol {
    var isFirstTime: Bool { get set }
    var userName: String { get set }
    
    func logged()
}

final public class SessionManager: SessionManagerProtocol {

    static let shared = SessionManager()

    private let userDefaults = UserDefaults.standard

    private init() { }
    
    public var userName: String {
        get {
            userDefaults.string(forKey: UserDefaultsKeys.userLogin).orEmpty
        }
        set {
            userDefaults.setValue(newValue, forKey: UserDefaultsKeys.userLogin)
        }
    }
    
    public var isFirstTime: Bool {
        get {
            userDefaults.bool(forKey: UserDefaultsKeys.isFirstTime)
        }
        set {
            userDefaults.setValue(newValue, forKey: UserDefaultsKeys.isFirstTime)
        }
    }
    
    public func logged() {
        isFirstTime = false
    }
    
}
