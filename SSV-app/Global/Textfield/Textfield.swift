import UIKit

public protocol MyPigTextfieldDelegate: AnyObject {
    func didBeginEditing()
    func didReturn()
    func didTextFieldDidEndEditing(_ textfield: UITextField)
}

public class MyPigTextfield: UITextField {
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorTheme.primaryTitle
        return view
    }()
    
    private lazy var placeholderText: UILabel = {
        let label = UILabel()
        label.textColor = ColorTheme.primaryTitle
        return label
    }()
    
    public override var placeholder: String? {
        get {
            return placeholderText.text
        }
        set {
            placeholderText.text = newValue
        }
    }
    
    weak var textfieldDelegate: MyPigTextfieldDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        delegate = self
        textColor = ColorTheme.primaryAction
        
        addSubviews(lineView, placeholderText)
        
        NSLayoutConstraint.activate([
        
            placeholderText.leadingAnchor.constraint(equalTo: leadingAnchor),
            placeholderText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            lineView.topAnchor.constraint(equalTo: bottomAnchor),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
        
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension MyPigTextfield: UITextFieldDelegate {
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        placeholderText.isHidden = true
        textfieldDelegate?.didBeginEditing()
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfieldDelegate?.didReturn()
        return false
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        placeholder(!(textField.text ?? "").isEmpty)
        textfieldDelegate?.didTextFieldDidEndEditing(textField)
    }
    
    
    private func placeholder(_ hasText: Bool) {
        placeholderText.isHidden = hasText
    }
}
