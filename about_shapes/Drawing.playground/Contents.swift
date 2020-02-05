import UIKit
import PlaygroundSupport

class CircleView: UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 300, y: 300))
        path.stroke()
    }
}


let view = CircleView(frame: CGRect(x:0, y:0 , width: 300, height:300))

view.backgroundColor = .red


PlaygroundPage.current.liveView = view
