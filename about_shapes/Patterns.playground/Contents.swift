import UIKit
import PlaygroundSupport

class PatternView: UIView {
    
    let drawPattern: CGPatternDrawPatternCallback = {
        _, context in
        context.addArc(center: CGPoint(x:20, y:20), radius: 10.0, startAngle: 0, endAngle: CGFloat(2.0 * .pi), clockwise: false)
        context.setFillColor(UIColor.black.cgColor)
        context.fillPath()
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()!
        
        UIColor.orange.setFill()
        context.fill(rect)
    }
}

class MyViewController: UIViewController{
    override func loadView() {
        let view = UIView()
        
        let patternView = PatternView()
        patternView.frame = CGRect(x:10, y:10, width: 200, height: 200)
        
        view.addSubview(patternView)
        
        view.backgroundColor = .white
        self.view = view
    }
}

PlaygroundPage.current.liveView = MyViewController()
