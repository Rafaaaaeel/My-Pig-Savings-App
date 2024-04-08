import UIKit


public class GreenView: StateView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorTheme.primaryFacelift
        dismissKeyboard()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func dismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        addGestureRecognizer(tapGesture)
    }
    
    public func roundConer() {
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMinYCorner]
    }
    
}
