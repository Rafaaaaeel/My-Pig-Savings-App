import UIKit

public class MyPigButton: UIButton {
    
    private var height: CGFloat = 60
    
    public enum ButtonType {
        case primary
        case secondary
        case main
    }
    
    public var title: String? {
        didSet {
            configTitle()
        }
    }
    
    private let type: ButtonType
    
    public init(type: ButtonType) {
        self.type = type
        super.init(frame: .zero)
        render()
    }
    
    required init?(coder: NSCoder) { nil }
    
    
    private func configTitle() {
        guard let title else { return }
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: ColorTheme.primaryTitle,
            .font: UIFont.systemFont(ofSize: 12, weight: .medium),
        ]
        let attributedText = NSAttributedString(string: title, attributes: attributes)
        setAttributedTitle(attributedText, for: [])
    }
    
    private func button() {
        switch type {
        case .primary:
            layer.cornerRadius = 6
            backgroundColor = ColorTheme.primaryAction
        case .secondary:
            backgroundColor = .clear
            layer.borderWidth = 1
            layer.cornerRadius = 6
            layer.borderColor = ColorTheme.primaryTitle.cgColor
        case .main:
            height = 30
            layer.cornerRadius = 15
            backgroundColor = ColorTheme.secondaryFacelift
        }
    }
    
    private func render() {
        button()
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = [
            heightAnchor.constraint(equalToConstant: height)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
}

extension MyPigButton {
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
        UIImpactFeedbackGenerator(style: .light).impactOccurred()
        super.touchesBegan(touches, with: event)
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform.identity
        }
        super.touchesEnded(touches, with: event)
    }
    
}
