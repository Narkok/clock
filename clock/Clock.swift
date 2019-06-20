import UIKit

@IBDesignable
class Clock: UIView {
    
    let circleView  = UIView()
    var circleSize  = CGFloat()
    var size        = CGFloat()
    
    var arrowLayers: [CALayer] = []
    var arrows: [CALayer] = []
    
    var arrowWidth  = CGFloat()
    var arrowHeight = CGFloat()
    
    var angle1: Int = 0
    var angle2: Int = 0
    
    var installed = false
    
    override func draw(_ rect: CGRect) {
        
        if installed { return }
        installed = true
        
        circleView.layer.allowsEdgeAntialiasing = true
        
        size = frame.width
        circleSize = size / 32 * 30
        arrowWidth = circleSize / 12
        arrowHeight = circleSize / 2.18
        
        circleView.frame = CGRect(x: (size - circleSize) / 2,
                                  y: (size - circleSize) / 2,
                                  width: circleSize,
                                  height: circleSize)
        
        circleView.layer.borderWidth = 0.4
        circleView.layer.borderColor = UIColor(white: 0.8, alpha: 1).cgColor
        circleView.layer.cornerRadius = circleSize / 2
        
        addSubview(circleView)
        
        for _ in 0..<2 {

            let arrowLayer = CALayer()
            
            arrowLayer.frame = CGRect(x: (size - circleSize) / 2,
                                      y: (size - circleSize) / 2,
                                      width: circleSize,
                                      height: circleSize)
            
            arrowLayers.append(arrowLayer)
            layer.addSublayer(arrowLayer)

            let arrow = CALayer()
            
            arrow.cornerRadius = arrowWidth / 2
            arrow.allowsEdgeAntialiasing = true
            let xPosition = (circleSize - arrowWidth) / 2
            let yPosition = (circleSize + arrowWidth) / 2 - arrowHeight
            
            arrow.backgroundColor = UIColor.black.cgColor
            arrow.frame = CGRect(x: xPosition,
                                 y: yPosition,
                                 width: arrowWidth,
                                 height: arrowHeight)
            arrowLayer.addSublayer(arrow)
            arrows.append(arrow)
        }
    }
    
    func rotate(angle1: Int, angle2: Int) {
        
        if arrowLayers.count == 0 { return }
        
        rotate(layer: arrowLayers[0], fromValue: num2rad(self.angle1), toValue: num2rad(angle1))
        rotate(layer: arrowLayers[1], fromValue: num2rad(self.angle2), toValue: num2rad(angle2))

        self.angle1 = angle1
        self.angle2 = angle2
    }
    
    private func rotate(layer: CALayer, fromValue: CGFloat, toValue: CGFloat) {
        let animation          = CABasicAnimation(keyPath: "transform.rotation")
        animation.fromValue    = fromValue
        animation.toValue      = toValue
        animation.duration     = 1
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        layer.add(animation, forKey: "rotatingAnimation")
        
        
        CATransaction.begin()
        CATransaction.setAnimationDuration(0)
        
        layer.transform = CATransform3DRotate(CATransform3DIdentity, toValue, 0, 0, 1)
        
        CATransaction.commit()
    }
}

func num2rad(_ number: Int) -> CGFloat {
    let newAngle = CGFloat(number * 360 / 8)
    return newAngle * CGFloat.pi / 180
}
