import UIKit


final public class ProgressView: UIView {
    
    public var percentage: [CGFloat] = [0,0] {
        didSet {
            animate()
        }
    }
    
    public let radius: CGFloat
    public let lineThickness: CGFloat
    public let lineColor: UIColor
    public let trackLineThickness: CGFloat
    
    private lazy var circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi / 2, endAngle: CGFloat.pi * 1.5, clockwise: true)
    private let trackLayer = CAShapeLayer()
    private let shapeLayer = CAShapeLayer()
    
    internal init(radius: CGFloat, lineThickness: CGFloat, lineColor: UIColor, trackLineThickness: CGFloat = 1) {
        self.radius = radius
        self.lineThickness = lineThickness
        self.lineColor = lineColor
        self.trackLineThickness = trackLineThickness
        super.init(frame: .zero)
        trackLayer.path = circularPath.cgPath
        layer.addSublayer(trackLayer)
        trackLayer.strokeColor = lineColor.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineWidth = trackLineThickness
        shapeLayer.path = circularPath.cgPath
        layer.addSublayer(shapeLayer)
        shapeLayer.strokeColor = ColorTheme.secondaryFacelift.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.lineWidth = lineThickness
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = .round
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func animate() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.fromValue = percentage[0]
        basicAnimation.toValue = percentage[1]
        basicAnimation.duration = 2
        basicAnimation.fillMode = .forwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation,forKey: "urBasic")
    }
    
}

