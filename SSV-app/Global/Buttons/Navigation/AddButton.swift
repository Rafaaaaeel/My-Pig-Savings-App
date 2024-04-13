import UIKit


public protocol AddButtonDelegate: AnyObject {
    
    func didTouchButton()
    
}

public class AddButton: UIBarButtonItem {
    
    public override init() {
        super.init()
        render()
    }
    
    required init?(coder: NSCoder) { nil }
    
    public weak var delegate: AddButtonDelegate?
    
    private func render() {
        image = Images.App.plus_gray
        style = .plain
        target = self
        action = #selector(didPressButton)
    }
    
    @objc internal func didPressButton() {
        delegate?.didTouchButton()
    }
    
}
