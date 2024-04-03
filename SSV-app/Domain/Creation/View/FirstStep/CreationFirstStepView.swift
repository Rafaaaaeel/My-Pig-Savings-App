import UIKit

private typealias Text = Texts.Creation
private typealias Image = Images.Creation

final internal class CreationFirstStepView: GreenView {
    
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
//        textfield.textfieldDelegate = self
        return textfield
    }()
    
    
    private lazy var goalTextfield: MyPigTextfield = {
        let textfield = MyPigTextfield()
//        textfield.textfieldDelegate = self
        return textfield
    }()
    
    private lazy var continueButton: MyPigButton = {
        let button = MyPigButton(type: .main)
        button.title = "Save"
//        button.addTarget(self, action: #selector(didTouchContinue), for: .touchUpInside)
        return button
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension CreationFirstStepView: CodableViews {
    
    internal func configView() {
        roundConer()
    }
    
    internal func setupHiearchy() {
        contentStackView.addArrangedSubviews(titleLabel, nameTextfield, goalTextfield)
        addSubviews(contentStackView, barImageView, continueButton)
    }
    
    internal func setupContraints() {
        let padding: CGFloat = 48
        
        let constraints = [
            barImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            barImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            
            continueButton.topAnchor.constraint(equalToSystemSpacingBelow: contentStackView.bottomAnchor, multiplier: 3),
            continueButton.widthAnchor.constraint(equalToConstant: 135),
            continueButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
