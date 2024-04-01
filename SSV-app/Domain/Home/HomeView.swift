import UIKit

protocol HomeViewDelegate: AnyObject {
    func didTouchCreate()
    func didTouchSummary()
}

final class HomeView: UIView {
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private lazy var mainImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = Images.Home.pig_savig
        return imageView
    }()
    
    private lazy var createGoalButton: SVVButton = {
        let button = SVVButton()
        button.addTarget(self, action: #selector(didTouchCreate), for: .touchUpInside)
        return button
    }()
    
    private lazy var achivementsButton: SVVButton = {
        let button = SVVButton()
        button.addTarget(self, action: #selector(didTouchSummary), for: .touchUpInside)
        return button
    }()
    
    weak var delegate: HomeViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    @objc func didTouchCreate() {
        delegate?.didTouchCreate()
    }
    
    @objc func didTouchSummary() {
        delegate?.didTouchSummary()
    }
}

extension HomeView: CodableViews {
    
    func configView() {
        backgroundColor = ColorTheme.primaryFacelift
    }
    
    func setupHiearchy() {
        contentStackView.addArrangedSubviews(mainImage, createGoalButton, achivementsButton)
        addSubviews(contentStackView)
    }
    
    func setupContraints() {
        let padding: CGFloat = 48
        let imageSize: CGFloat = 150
        
        let constraints = [
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -padding),
            contentStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -58),
            
            mainImage.widthAnchor.constraint(equalToConstant: imageSize),
            mainImage.heightAnchor.constraint(equalToConstant: imageSize)
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
