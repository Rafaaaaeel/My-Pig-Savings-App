import UIKit


final class DetailView: WhiteView {
    
    //contentStackView
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.alignment = .center
        return stack
    }()
    
    //textStackView
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    //label
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "You have reached"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    //Textfield
    private lazy var savedTextField: MyPigTextfield2 = {
        let label = MyPigTextfield2()
        label.placeholder = goal.value?.decimalValue.asCurrencyValue
        return label
    }()
    
    //label
    private lazy var goalLabel: UILabel = {
        let label = UILabel()
        label.text = "of your \(goal.goal?.decimalValue.asCurrencyValue ?? "") saving goal"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    //Label
    private lazy var percentageLabel: UILabel = {
        let total = goal.goal?.doubleValue ?? 0
        let saved = goal.value?.doubleValue ?? 0
        let percentual = (saved / total) * 100
        let label = UILabel()
        label.text = (saved / total).percentageFormatted
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textColor = ColorTheme.secondaryFacelift
        label.textAlignment = .center
        return label
    }()
    
    //Progress
    private lazy var progressView: ProgressView = {
        let view = ProgressView(radius: 140, lineThickness: 10, lineColor: .lightGray, trackLineThickness: 3)
        let total = goal.goal?.doubleValue ?? 0
        let saved = goal.value?.doubleValue ?? 0
        view.percentage = (saved / total)
        return view
    }()
    
    //tableView
    
    private let goal: Goal
    
    internal init(_ goal: Goal) {
        self.goal = goal
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension DetailView: CodableViews {
    
    internal func setupHiearchy() {
        progressView.addSubviews(percentageLabel)
        textStackView.addArrangedSubviews(titleLabel, savedTextField, goalLabel)
        contentStackView.addArrangedSubviews(textStackView, progressView)
        contentStackView.setCustomSpacing(200, after: textStackView)
        addSubviews(contentStackView)
    }
    
    internal func setupContraints() {
        let constraints = [
            percentageLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),

        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

