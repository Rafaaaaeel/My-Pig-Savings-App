// MARK: - Imports
import UIKit


// MARK: - Alias
private typealias Image = Images.Home
private typealias Text = Texts.Home

// MARK: - Delegate
internal protocol HomeViewDelegate: AnyObject {
    func didTouchCreate()
    func didTouchSummary()
    func didTouchShowGoals()
    func didTouchEditUser()
}

// MARK: - View
final internal class HomeView: GreenView {

    private let userName: String
    
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
        label.text = userName
        label.numberOfLines = 1
        label.textColor = ColorTheme.primaryTitle
        label.font = Fonts.title
        return label
    }()
    
    private lazy var accountMenuView: AccountMenuView = {
        let view = AccountMenuView()
        view.delegate = self
        return view
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
        button.isHidden = true
        button.addTarget(self, action: #selector(didTouchCreate), for: .touchUpInside)
        return button
    }()
    
    private lazy var showGoalsButton: MyPigButton = {
        let button = MyPigButton(type: .primary)
        button.title = Text.GOALS
        button.isHidden = true
        button.addTarget(self, action: #selector(didTouchShowGoals), for: .touchUpInside)
        return button
    }()
    
    private lazy var achivementsButton: MyPigButton = {
        let button = MyPigButton(type: .secondary)
        button.title = Text.ACHIEVEMENT
        button.addTarget(self, action: #selector(didTouchSummary), for: .touchUpInside)
        return button
    }()
    
    internal weak var delegate: HomeViewDelegate?
    
    internal init(user name: String) {
        self.userName = name
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func loadEmpty() {
        createGoalButton.isHidden = false
    }
    
    override func loadNonEmpty() {
        showGoalsButton.isHidden = false
    }

}

// MARK: - Actions
extension HomeView {
    
    @objc internal func didTouchCreate() {
        delegate?.didTouchCreate()
    }
    
    @objc internal func didTouchSummary() {
        delegate?.didTouchSummary()
    }
    
    @objc internal func didTouchShowGoals() {
        delegate?.didTouchShowGoals()
    }
    
}

// MARK: - CodableView
extension HomeView: CodableViews {
    
    internal func setupHiearchy() {
        textStackView.addArrangedSubviews(helloLabel, nameLabel)
        topLeadingStackView.addArrangedSubviews(textStackView)
        contentStackView.addArrangedSubviews(topLeadingStackView, pigImageView, showGoalsButton, createGoalButton, achivementsButton)
        addSubviews(contentStackView, accountMenuView)
    }
    
    internal func setupContraints() {
        let padding: CGFloat = 48
        
        let constraints = [
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            contentStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -58),
            
            accountMenuView.trailingAnchor.constraint(equalTo: trailingAnchor),
            accountMenuView.centerYAnchor.constraint(equalTo: textStackView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension HomeView: AccountMenuViewDelegate {
    
    internal func didTouchUser() {
        delegate?.didTouchEditUser()
    }
    
}
