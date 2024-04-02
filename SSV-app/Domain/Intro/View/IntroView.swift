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
    
    weak var delegate: IntroViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}


// MARK: - Actions
extension IntroView {
    
    @objc func didTouchContinue() {
        guard isNameFieldValid() else { return }
        delegate?.didText(nameText)
    }
    
}

// MARK: - CodableView
extension IntroView: CodableViews {
    
    func setupHiearchy() {
        contentStackView.addArrangedSubviews(thoughtsImageView, questionLabel, nameTextfield, continueButton)
        contentStackView.setCustomSpacing(0, after: thoughtsImageView)
        contentStackView.setCustomSpacing(48, after: nameTextfield)
        addSubviews(contentStackView)
    }
    
    func setupContraints() {
        let padding: CGFloat = 48
        let imageSize: CGFloat = 300
        
        topConstraint = contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 150)
        
        let constraints = [
            topConstraint,
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            
            thoughtsImageView.widthAnchor.constraint(equalToConstant: imageSize),
            thoughtsImageView.heightAnchor.constraint(equalToConstant: imageSize)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

// MARK: - MyPigTextfieldDelegate
extension IntroView: MyPigTextfieldDelegate {
    
    func didBeginEditing() {
        animate()
    }
    
    func didReturn() {
        endEditing(true)
    }
    
    func didTextFieldDidEndEditing(_ textfield: UITextField) {
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
