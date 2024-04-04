import UIKit

final internal class CreationView: WhiteView {
    
    private lazy var cardView = CardView()
    private lazy var infoView = InfoView()
    
    private var initialTouchPoint: CGPoint = CGPoint(x: 0,y: 0)
    private var isDragging = false
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }

}

extension CreationView: CodableViews {
    
    internal func configView() {
        infoView.delegate = self
    }
    
    internal func setupHiearchy() {
        addSubviews(cardView, infoView)
    }
    
    internal func setupContraints() {
        let constraints = [
            cardView.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 5),
            cardView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: cardView.trailingAnchor, multiplier: 2),
            cardView.bottomAnchor.constraint(equalTo: infoView.topAnchor, constant: -20),
            
            infoView.topAnchor.constraint(equalTo: topAnchor, constant: Frame.height / 3),
            infoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            infoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            infoView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension CreationView {
    
    //TODO: - MAKE IT WORK
    @objc func handlePanGesture(_ recognizer: UIPanGestureRecognizer) {
        let touchPoint = recognizer.location(in: window)
        
        if recognizer.state == UIGestureRecognizer.State.began {
            initialTouchPoint = touchPoint
        } else if recognizer.state == UIGestureRecognizer.State.changed {
            let deltaY = touchPoint.y - initialTouchPoint.y
            isDragging = true
            infoView.frame = CGRect(x: infoView.frame.origin.x,
                                          y: infoView.frame.origin.y + deltaY,
                                          width: infoView.frame.size.width,
                                          height: infoView.frame.size.height)
            initialTouchPoint = touchPoint
        } else if recognizer.state == UIGestureRecognizer.State.ended || recognizer.state == UIGestureRecognizer.State.cancelled {
            
            if touchPoint.y > 50 {
                print("View puxada para baixo!")
            }
            
            isDragging = false
            UIView.animate(withDuration: 0.3) {
                self.infoView.frame = CGRect(x: 0, y: 150, width: 0, height: 0)
            }
        }
    }
    
}

extension CreationView: InfoViewDelegate {
    
    func didTouchSave(_ model: Creator) {
        
    }
    
    func didChangeName(_ text: String) {
        cardView.nameText = text
    }
    
    func didChangeValue(_ text: String) {
        cardView.totalText = text
    }
    
}

extension CreationView {
    
    private func setupTouch() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        infoView.addGestureRecognizer(panGesture)
    }
    
}
