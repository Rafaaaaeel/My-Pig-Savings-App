import UIKit


final internal class CreationFirstStepView: GreenView {
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension CreationFirstStepView: CodableViews {
    
    internal func configView() {
        clipsToBounds = true
        layer.cornerRadius = 30
        layer.maskedCorners = [.layerMinXMinYCorner]
    }
    
    internal func setupHiearchy() {
        
    }
    
    internal func setupContraints() {
        
    }
    
}
