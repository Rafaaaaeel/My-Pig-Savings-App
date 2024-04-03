// MARK: - Imports
import UIKit


// MARK: - Alias
private typealias Image = Images.Intro
private typealias Text = Texts.Intro

// MARK: - Delegate
protocol IntroViewDelegate: AnyObject {
    func didText(_ text: String)
}

// MARK: - View
final class IntroView: GreenView {
    
    private var topConstraint = NSLayoutConstraint()
    private var nameText: String = .empty
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalSpacing
        return stack
    }()
    
    private lazy var thoughtsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Image.thoughts
        return imageView
    }()
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.text = Text.QUESTION
        label.numberOfLines = 2
        label.textColor = ColorTheme.primaryAction
        label.font = Fonts.subTitle
        label.textAlignment = .center
        return label
    }()
    
    private lazy var nameTextfield: MyPigTextfield = {
        let textfield = MyPigTextfield()
        textfield.textfieldDelegate = self
        return textfield
    }()
    
    private lazy var continueButton: MyPigButton = {
        let button = MyPigButton(type: .primary)
        button.title = Text.GET_STARTED
        button.addTarget(self, action: #selector(didTouchContinue), for: .touchUpInside)
        return button
    }()
    
    internal weak var delegate: IntroViewDelegate?
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}


// MARK: - Actions
extension IntroView {
    
    @objc internal func didTouchContinue() {
        guard isNameFieldValid() else { return }
        delegate?.didText(nameText)
    }
    
}

// MARK: - CodableView
extension IntroView: CodableViews {
    
    internal func setupHiearchy() {
        contentStackView.addArrangedSubviews(thoughtsImageView, questionLabel, nameTextfield, continueButton)
        contentStackView.setCustomSpacing(0, after: thoughtsImageView)
        contentStackView.setCustomSpacing(48, after: nameTextfield)
        addSubviews(contentStackView)
    }
    
    internal func setupContraints() {
        let padding: CGFloat = 48
        
        topConstraint = contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50)
        
        let constraints = [
            topConstraint,
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

// MARK: - MyPigTextfieldDelegate
extension IntroView: MyPigTextfieldDelegate {
    
    internal func didBeginEditing() {
        animate()
    }
    
    internal func didReturn() {
        endEditing(true)
    }
    
    internal func didTextFieldDidEndEditing(_ textfield: UITextField) {
        animate()
        guard let input = textfield.text else { return }
        nameText = input
    }
    
}

// MARK: - Private Methods
extension IntroView {
    
    private func isNameFieldValid() -> Bool {
        return nameText.isNotEmpty && Regex.validate(input: nameText, .onlyCharactersToTen)
    }
    
    private func animate() {
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: 0.2) {
                self?.topConstraint.constant = self?.topConstraint.constant ?? 0 > 0 ? -40 : 150
            }
        }
    }
    
}
