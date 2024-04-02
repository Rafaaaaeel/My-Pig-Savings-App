// MARK: - Imports
import UIKit


// MARK: - Alias
private typealias Image = Images.Home
private typealias Text = Texts.Home

// MARK: - Delegate
internal protocol HomeViewDelegate: AnyObject {
    func didTouchCreate()
    func didTouchSummary()
}

// MARK: - View
final internal class HomeView: GreenView {
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    private lazy var topLeadingStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        return stack
    }()
    
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = Text.HELLO
        label.numberOfLines = 1
        label.font = Fonts.subTitle
        label.textColor = ColorTheme.primaryAction
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rafael" //TODO: GET NAME FROM USER AND PASS IT HERE IN THE FUTURE
        label.numberOfLines = 1
        label.textColor = .white
        label.font = Fonts.title
        return label
    }()
    
    private lazy var pigImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Image.pig_savig
        return imageView
    }()
    
    private lazy var createGoalButton: MyPigButton = {
        let button = MyPigButton(type: .primary)
        button.title = Text.NEW_GOAL
        button.addTarget(self, action: #selector(didTouchCreate), for: .touchUpInside)
        return button
    }()
    
    private lazy var achivementsButton: MyPigButton = {
        let button = MyPigButton(type: .secondary)
        button.title = Text.ACHIEVEMENT
        button.addTarget(self, action: #selector(didTouchSummary), for: .touchUpInside)
        return button
    }()
    
    internal weak var delegate: HomeViewDelegate?
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }

}

// MARK: - Actions
extension HomeView {
    
    @objc internal func didTouchCreate() {
        delegate?.didTouchCreate()
    }
    
    @objc internal func didTouchSummary() {
        delegate?.didTouchSummary()
    }
    
}

// MARK: - CodableView
extension HomeView: CodableViews {
    
    internal func setupHiearchy() {
        textStackView.addArrangedSubviews(helloLabel, nameLabel)
        topLeadingStackView.addArrangedSubviews(textStackView)
        contentStackView.addArrangedSubviews(topLeadingStackView, pigImageView, createGoalButton, achivementsButton)
        addSubviews(contentStackView)
    }
    
    internal func setupContraints() {
        let padding: CGFloat = 48
        let imageSize: CGFloat = 300
        
        let constraints = [
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            contentStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -58),
            
            pigImageView.widthAnchor.constraint(equalToConstant: imageSize),
            pigImageView.heightAnchor.constraint(equalToConstant: imageSize)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
