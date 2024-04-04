import UIKit

private typealias Text = Texts.Creation
private typealias Image = Images.Creation

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
    }
    
}

extension InfoView: MyPigTextfieldDelegate {
    
    func didChangedText(_ textfield: UITextField) {
        guard let text = textfield.text,  textfield.keyboardType == .numberPad else { return }
        
        textfield.text = text.currencyInputFormatting()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text, textField.keyboardType == .numberPad else { return true }
        
        return string.isEmpty ? true : Regex.validate(input: text + string, .onlyToSixTeenNumbers)
    }
    
}
