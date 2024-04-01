import UIKit

public extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            addArrangedSubview(view)
        }
    }
    
    
}
