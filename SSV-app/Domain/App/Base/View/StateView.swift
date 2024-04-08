import UIKit


public class StateView: UIView {
    
    public enum State {
        case notSet
        case empty
        case nonEmpty
    }
    
    public var state: State = .notSet{
        didSet {
            render()
        }
    }
    
    private func render() {
        switch state {
        case .empty:
            loadEmpty()
        case .nonEmpty:
            loadNonEmpty()
        default:
            loadDefault()
        }
    }
    
    public func loadDefault() {}
    
    public func loadEmpty() { }
    
    public func loadNonEmpty() { }
    
}
