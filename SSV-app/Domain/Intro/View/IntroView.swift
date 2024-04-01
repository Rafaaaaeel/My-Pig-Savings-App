import UIKit

private typealias Image = Images.Intro
private typealias Text = Texts.Intro

final class IntroView: GreenView {
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension IntroView: CodableViews {
    
    func setupHiearchy() {
        contentStackView.addArrangedSubviews(thoughtsImageView, questionLabel)
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
            
            thoughtsImageView.widthAnchor.constraint(equalToConstant: imageSize),
            thoughtsImageView.heightAnchor.constraint(equalToConstant: imageSize)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
