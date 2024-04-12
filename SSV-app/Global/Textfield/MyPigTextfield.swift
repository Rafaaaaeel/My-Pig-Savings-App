import UIKit

//TODO: - NEEDS REFACTORING

public protocol MyPigTextfield2Delegate: AnyObject {
    
    func didBeginEditing(_ textField: UITextField)
    func didReturn(_ textField: UITextField)
    func didTextFieldDidEndEditing(_ textfield: UITextField)
    func didChangedText(_ textfield: UITextField)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    
}

extension MyPigTextfield2Delegate {
    
    func didBeginEditing(_ textField: UITextField) { }
    func didReturn(_ textField: UITextField) { }
    func didTextFieldDidEndEditing(_ textfield: UITextField) { }
    func didChangedText(_ textfield: UITextField) { }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool { true }
    
}

public class MyPigTextfield2: UITextField {
    
    
    public override var placeholder: String? {
        get {
            return self.text
        }
        set {
            let attributes: [NSAttributedString.Key: Any] = [
                NSAttributedString.Key.foregroundColor: ColorTheme.primaryAction,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30, weight: .bold)
                    ]
            self.attributedText = NSAttributedString(string: newValue ?? "", attributes: attributes)
        }
    }
    
    weak var textfieldDelegate: MyPigTextfield2Delegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        textColor = ColorTheme.primaryAction
        addTarget(self, action: #selector(didChangedText), for: .editingChanged)
        
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension MyPigTextfield2: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        textfieldDelegate?.didBeginEditing(textField)
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        textfieldDelegate?.didReturn(textField)
        return false
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        textfieldDelegate?.didTextFieldDidEndEditing(textField)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return textfieldDelegate?.textField(textField, shouldChangeCharactersIn: range, replacementString: string) ?? true
    }
    
    @objc internal func didChangedText(_ textfield: UITextField) {
        textfieldDelegate?.didChangedText(textfield)
    }
    
}
