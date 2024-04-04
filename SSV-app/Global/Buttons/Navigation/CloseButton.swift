import UIKit


public protocol CloseButtonDelegate: AnyObject {
    
    func didTouchButton()
    
}

public class CloseButton: UIBarButtonItem {
    
    public override init() {
        super.init()
        render()
    }
    
    required init?(coder: NSCoder) { nil }
    
    public weak var delegate: CloseButtonDelegate?
    
    private func render() {
        image = Images.App.close
        style = .plain
        target = self
        action = #selector(didPressButton)
    }
    
    @objc internal func didPressButton() {
        delegate?.didTouchButton()
    }
    
}
