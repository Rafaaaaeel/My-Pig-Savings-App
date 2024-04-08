import UIKit


public class WhiteView: StateView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorTheme.primaryTitle
        dismissKeyboard()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func dismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        addGestureRecognizer(tapGesture)
    }
    
}
