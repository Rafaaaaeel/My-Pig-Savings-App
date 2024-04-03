import UIKit


final internal class CreationView: WhiteView {
    
    private lazy var firstStepView = CreationFirstStepView()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension CreationView: CodableViews {
    
    internal func configView() {
        
    }
    
    internal func setupHiearchy() {
        addSubviews(firstStepView)
    }
    
    internal func setupContraints() {
        let constraints = [
            firstStepView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.height / 3),
            firstStepView.leadingAnchor.constraint(equalTo: leadingAnchor),
            firstStepView.trailingAnchor.constraint(equalTo: trailingAnchor),
            firstStepView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
