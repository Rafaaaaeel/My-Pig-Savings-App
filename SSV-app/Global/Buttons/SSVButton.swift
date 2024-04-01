import UIKit

public class SVVButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ColorTheme.primaryAction
        layer.cornerRadius = 6
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.systemFont(ofSize: 12, weight: .medium),
        ]
        let attributedText = NSAttributedString(string: "NEW GOAL", attributes: attributes)
        setAttributedTitle(attributedText, for: [])
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let constraint = [
            heightAnchor.constraint(equalToConstant: 60)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    required init?(coder: NSCoder) { nil }
    
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
    SVVButton()
}
