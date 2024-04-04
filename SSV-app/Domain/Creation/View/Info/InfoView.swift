import UIKit

private typealias Text = Texts.Creation
private typealias Image = Images.Creation

protocol InfoViewDelegate: AnyObject {
    
    func didChangeName(_ text: String)
    func didChangeValue(_ text: String)
    func didTouchSave(_ model: Creator)
    
}

final internal class InfoView: GreenView {

    internal var model = Creator()
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Text.LETS_DO_IT
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.subTitle
        return label
    }()
    
    private lazy var barImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Image.bar
        return imageView
    }()
    
    private lazy var nameTextfield: MyPigTextfield = {
        let textfield = MyPigTextfield()
        textfield.textfieldDelegate = self
        textfield.placeholder = Text.NAME
        return textfield
    }()
    
    private lazy var goalTextfield: MyPigTextfield = {
        let textfield = MyPigTextfield()
        textfield.textfieldDelegate = self
        textfield.placeholder = Text.VALUE
        textfield.keyboardType = .numberPad
        return textfield
    }()
    
    private lazy var continueButton: MyPigButton = {
        let button = MyPigButton(type: .main)
        button.title = Text.SAVE
        button.addTarget(self, action: #selector(didTouchSave), for: .touchUpInside)
        return button
    }()
    
    internal weak var delegate: InfoViewDelegate?
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension InfoView: CodableViews {
    
    internal func configView() {
        roundConer()
    }
    
    internal func setupHiearchy() {
        contentStackView.addArrangedSubviews(titleLabel, nameTextfield, goalTextfield)
        addSubviews(contentStackView, barImageView, continueButton)
    }
    
    internal func setupContraints() {
        let padding: CGFloat = 48
        let width: CGFloat = 135
        
        let constraints = [
            barImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            barImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            
            continueButton.topAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 3),
            continueButton.widthAnchor.constraint(equalToConstant: width),
            continueButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension InfoView {
    
    @objc internal func didTouchSave() {
        model.name = nameTextfield.text.orEmpty
        model.total = goalTextfield.text.orEmpty.toDecimal
        delegate?.didTouchSave(model)
    }
    
}

extension InfoView: MyPigTextfieldDelegate {
    
    internal func didChangedText(_ textfield: UITextField) {
        guard let text = textfield.text,  textfield.keyboardType == .numberPad else {
            delegate?.didChangeName(textfield.text.orEmpty)
            return
        }
        
        let finalText =  text.currencyInputFormatting()
        textfield.text = finalText
        delegate?.didChangeValue(finalText)
    }
    
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        
        let newText = text + string
        guard textField.keyboardType == .numberPad else {
            return string.isEmpty ? true : validateUsername(newText)
        }
        
        return string.isEmpty ? true : validateCurrency(newText)
    }
    
}

extension InfoView {
    
    private func validateUsername(_ input: String) -> Bool {
        return Regex.validate(input: input, .onlyCharactersToTen)
    }
    
    private func validateCurrency(_ input: String) -> Bool {
        return Regex.validate(input: input, .onlyToSixTeenNumbers)
    }
    
}
