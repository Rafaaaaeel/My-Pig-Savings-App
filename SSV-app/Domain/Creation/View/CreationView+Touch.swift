import UIKit

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
