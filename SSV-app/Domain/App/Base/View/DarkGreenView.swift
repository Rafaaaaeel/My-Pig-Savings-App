import UIKit


public class DarkGreenView: StateView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorTheme.primaryAction
        translatesAutoresizingMaskIntoConstraints = false
        dismissKeyboard()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func dismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        addGestureRecognizer(tapGesture)
    }
}
