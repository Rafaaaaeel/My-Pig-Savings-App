import UIKit

internal enum OperationType: Int {
    case increase, decrease
}

internal protocol DetailViewDelegate: AnyObject {
    
    func didChangeValue(_ newValue: Decimal, _ value: Decimal, operation type: OperationType)
    
}


final internal class DetailView: WhiteView {
    
    private var lastPercentage: CGFloat = 0
    private var isFirstLoading = true
    
    private lazy var contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 32
        stack.alignment = .center
        return stack
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "You have reached"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var savedTextField: MyPigTextfield2 = {
        let label = MyPigTextfield2()
        label.textfieldDelegate = self
        label.keyboardType = .numberPad
        return label
    }()
    
    private lazy var goalLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        label.textColor = ColorTheme.secondaryFacelift
        label.textAlignment = .center
        return label
    }()
    
    private lazy var progressView = ProgressView(radius: 140, lineThickness: 10, lineColor: .lightGray, trackLineThickness: 3)
    
    private lazy var lastTransactionTableView = TransactionTableView()
    
    internal var goal: Goal {
        didSet {
            render()
        }
    }
    
    private var savedValue: Decimal {
        return goal.value?.decimalValue ?? 0
    }
    
    internal weak var delegate: DetailViewDelegate?
    
    internal init(_ goal: Goal) {
        self.goal = goal
        super.init(frame: .zero)
        let total = goal.goal?.doubleValue ?? 0
        let saved = goal.value?.doubleValue ?? 0
        lastPercentage = (saved / total)
        setup()
        render()
        isFirstLoading = false
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func render() {
        let total = goal.goal?.doubleValue ?? 0
        let saved = goal.value?.doubleValue ?? 0
        percentageLabel.text = (saved / total).percentageFormatted
        goalLabel.text = "of your \(goal.goal?.decimalValue.asCurrencyValue ?? "") saving goal"
        savedTextField.placeholder = goal.value?.decimalValue.asCurrencyValue
        progressView.percentage = [isFirstLoading ? 0 : lastPercentage, (saved / total)]
        lastPercentage = (saved / total)
        lastTransactionTableView.update(goal.lastTransaction)
    }
    
}

extension DetailView: CodableViews {
    
    internal func setupHiearchy() {
        progressView.addSubviews(percentageLabel)
        textStackView.addArrangedSubviews(titleLabel, savedTextField, goalLabel)
        contentStackView.addArrangedSubviews(textStackView, progressView)
        contentStackView.setCustomSpacing(200, after: textStackView)
        addSubviews(contentStackView, lastTransactionTableView)
    }
    
    internal func setupContraints() {
        let constraints = [
            percentageLabel.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            percentageLabel.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -24),
            
            lastTransactionTableView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 60),
            lastTransactionTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            lastTransactionTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            lastTransactionTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 2)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension DetailView: MyPigTextfield2Delegate {
    
    internal func didTextFieldDidEndEditing(_ textfield: UITextField) {
        if let text = textfield.text {
            let finalText = text.currencyInputFormatting()
            textfield.text = finalText
            saveEditing(finalText.toDecimal)
        }
    }
    
}

extension DetailView {
    
    private func saveEditing(_ newValue: Decimal) {
        let difference = newValue - savedValue
        let operationType: OperationType = difference > 0 ? .increase : .decrease
        guard difference != 0 else { return }
        delegate?.didChangeValue(newValue, difference, operation: operationType)
    }
    
}
