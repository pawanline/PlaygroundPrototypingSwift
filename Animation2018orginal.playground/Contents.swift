//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
    let animatedView = AnimatedWaveView()
    animatedView.frame = CGRect(x: 30, y: 100, width: 200, height: 200)
animatedView.makeWaves()
view.addSubview(animatedView)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


  class AnimatedWaveView: UIView {
    
     let baseRect = CGRect(x: 0, y: 0, width: 10, height: 10)
    
    public func makeWaves() {
    print("make waves called")
        DispatchQueue.main.async {
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.addAnimatedWave), userInfo: nil, repeats: true)
        }
    }
    
    @objc  func addAnimatedWave() {
        let waveLayer = self.buildWave(rect: baseRect)
        self.layer.addSublayer(waveLayer)
        self.animateWave(waveLayer: waveLayer)
    }
    
     func buildWave(rect: CGRect) -> CAShapeLayer {
        let circlePath = UIBezierPath(ovalIn: rect)
        let waveLayer = CAShapeLayer()
        waveLayer.bounds = rect
        waveLayer.frame = rect
        waveLayer.position = self.center
        waveLayer.strokeColor = UIColor.black.cgColor
        waveLayer.fillColor = UIColor.clear.cgColor
        waveLayer.lineWidth = 5.0
        waveLayer.path = circlePath.cgPath
        waveLayer.strokeStart = 0
        waveLayer.strokeEnd = 1
        return waveLayer
    }
    
    private let scaleFactor: CGFloat = 1.5
    
     func animateWave(waveLayer: CAShapeLayer) {
        // Scaling animation
        let finalRect = self.bounds.applying(CGAffineTransform(scaleX: scaleFactor, y: scaleFactor))
        let finalPath = UIBezierPath(ovalIn: finalRect)
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = waveLayer.path
        animation.toValue = finalPath.cgPath
        
        // Bounds animation
        let posAnimation = CABasicAnimation(keyPath: "bounds")
        posAnimation.fromValue = waveLayer.bounds
        posAnimation.toValue = finalRect
        
        // Group
        let scaleWave = CAAnimationGroup()
        scaleWave.animations = [animation, posAnimation]
        scaleWave.duration = 10
        scaleWave.setValue(waveLayer, forKey: "waveLayer")
        scaleWave.delegate = self
        scaleWave.isRemovedOnCompletion = true
        waveLayer.add(scaleWave, forKey: "scale_wave_animation")
    }
}

extension AnimatedWaveView: CAAnimationDelegate {
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let waveLayer = anim.value(forKey: "waveLayer") as? CAShapeLayer {
            print("delegate called")
            waveLayer.removeFromSuperlayer()
        }
    }
}
