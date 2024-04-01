import UIKit

public class SVVButton: UIButton {
    
    public enum ButtonType {
        case primary
        case secondary
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
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 12, weight: .medium),
        ]
        let attributedText = NSAttributedString(string: title, attributes: attributes)
        setAttributedTitle(attributedText, for: [])
    }
    
    private func button() {
        switch type {
        case .primary:
            backgroundColor = ColorTheme.primaryAction
        case .secondary:
            backgroundColor = .clear
            layer.borderWidth = 1
            layer.borderColor = UIColor.white.cgColor
        }
    }
    
    private func render() {
        button()
        layer.cornerRadius = 6
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = [
            heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
}

extension SVVButton {
    
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


#Preview {
    SVVButton(type: .primary)
}
