import UIKit


public protocol BackButtonDelegate: AnyObject {
    
    func didTouchButton()
    
}

public class BackButton: UIBarButtonItem {
    
    public override init() {
        super.init()
        render()
    }
    
    required init?(coder: NSCoder) { nil }
    
    public weak var delegate: BackButtonDelegate?
    
    private func render() {
        image = Images.App.arrow_left
        style = .plain
        target = self
        action = #selector(didPressButton)
    }
    
    @objc internal func didPressButton() {
        delegate?.didTouchButton()
    }
    
}
