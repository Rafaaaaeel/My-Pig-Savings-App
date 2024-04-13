import UIKit

private typealias Image = Images.Home

internal protocol AccountMenuViewDelegate: AnyObject {
    
    func didTouchUser()
    
}

final internal class AccountMenuView: DarkGreenView {
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Image.person_fill
        return imageView
    }()
    
    internal weak var delegate: AccountMenuViewDelegate?
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension AccountMenuView: CodableViews {
    
    internal func configView() {
        addShadow()
        let addGesture = UITapGestureRecognizer(target: self, action: #selector(didTouchUser))
        addGestureRecognizer(addGesture)
        layer.cornerRadius = 33
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    }
    
    internal func setupHiearchy() {
        addSubviews(iconImageView)
    }
    
    internal func setupContraints() {
        let constraints = [
            heightAnchor.constraint(equalToConstant: 66),
            widthAnchor.constraint(equalToConstant: 76),
            
            iconImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension AccountMenuView {
    
    @objc internal func didTouchUser() {
        delegate?.didTouchUser()
    }
    
}
