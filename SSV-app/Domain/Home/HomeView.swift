// MARK: - Imports
import UIKit

// MARK: - Alias
private typealias Image = Images.Home
private typealias Text = Texts.Home

// MARK: - Delegate
protocol HomeViewDelegate: AnyObject {
    func didTouchCreate()
    func didTouchSummary()
}

// MARK: - View
final class HomeView: UIView {
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8

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
    
    // TODO: CREATE A FACTORY FOR LABELS OR AN BASE FONT
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = Text.HELLO
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textColor = ColorTheme.primaryAction
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Rafael" //TODO: GET NAME FROM USER AND PASS IT HERE IN THE FUTURE
        label.numberOfLines = 1
        label.textColor = .white
        label.font = .systemFont(ofSize: 34, weight: .semibold)
        return label
    }()
    
    private lazy var pigImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Image.pig_savig
        return imageView
    }()
    
    private lazy var createGoalButton: SVVButton = {
        let button = SVVButton(type: .primary)
        button.title = Text.NEW_GOAL
        button.addTarget(self, action: #selector(didTouchCreate), for: .touchUpInside)
        return button
    }()
    
    private lazy var achivementsButton: SVVButton = {
        let button = SVVButton(type: .secondary)
        button.title = Text.ACHIEVEMENT
        button.addTarget(self, action: #selector(didTouchSummary), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: HomeViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }

}

// MARK: - Actions
extension HomeView {
    
    @objc func didTouchCreate() {
        delegate?.didTouchCreate()
    }
    
    @objc func didTouchSummary() {
        delegate?.didTouchSummary()
    }
    
}

// MARK: - CodableView
extension HomeView: CodableViews {
    
    func configView() {
        backgroundColor = ColorTheme.primaryFacelift
    }
    
    func setupHiearchy() {
        textStackView.addArrangedSubviews(helloLabel, nameLabel)
        topLeadingStackView.addArrangedSubviews(textStackView)
        contentStackView.addArrangedSubviews(topLeadingStackView, pigImageView, createGoalButton, achivementsButton)
        addSubviews(contentStackView)
    }
    
    func setupContraints() {
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
