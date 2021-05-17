//
//  ShimmerView.swift
//  MainApp
//
//  Created by Lelio Jorge on 13/05/21.
//

import UIKit

class ShimmerView: UIView {
    
    func startAnimation() {
        let key = "backgroundColor"
        let animationGroup = setupAnimationGroup()
        let gradient = setupGradient(animationGroup: animationGroup, forkey: key)
        layer.addSublayer(gradient)
    }
    
    private func createGradient(startPoint: CGPoint, endPoint: CGPoint) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = self.bounds
        return gradient
    }
    
    private func setupGradient(animationGroup: CAAnimationGroup, forkey: String) -> CAGradientLayer {
        let start = CGPoint(x: 0, y: 0.5)
        let end = CGPoint(x: 1, y: 0.5)
        let gradient = createGradient(startPoint: start, endPoint: end)
        gradient.add(animationGroup, forKey: forkey)
        return gradient
    }
    
    private func createAnimation(beginTime: CFTimeInterval, duration: CFTimeInterval, fromValue: CGColor, toValue: CGColor) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.backgroundColor))
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = duration
        animation.beginTime = beginTime
        return animation
    }
    
    private func setupAnimations(duration: CFTimeInterval) -> [CABasicAnimation] {
        let animation = createAnimation(beginTime: 0.0, duration: duration, fromValue: UIColor.gradientLightGrey.cgColor, toValue: UIColor.gradientDarkGrey.cgColor)
        let animation2 = createAnimation(beginTime: animation.beginTime + animation.duration, duration: duration, fromValue: UIColor.gradientDarkGrey.cgColor, toValue: UIColor.gradientLightGrey.cgColor)
        return [animation,animation2]
    }
    
    private func createAnimationGroup(animations: [CABasicAnimation], duration: CFTimeInterval, previousGroup: CAAnimationGroup?) -> CAAnimationGroup {
        let group = CAAnimationGroup()
        group.animations = animations
        group.repeatCount = .greatestFiniteMagnitude
        group.duration = duration
        group.isRemovedOnCompletion = false
        
        if let previousGroup = previousGroup {
            group.beginTime = previousGroup.beginTime + 0.33
        }
        
        group.beginTime = 0.0
        
        return group
    }
    
    private func setupAnimationGroup() -> CAAnimationGroup {
        let duration: CFTimeInterval = 1.5
        let animations = setupAnimations(duration: duration)
        let animationGroup = createAnimationGroup(animations: animations, duration: duration * 2, previousGroup: nil)
        return animationGroup
    }
}






extension UIColor {
    static var gradientDarkGrey: UIColor {
        return UIColor(red: 219 / 255.0, green: 221 / 255.0, blue: 221 / 255.0, alpha: 1)
    }
    
    static var gradientLightGrey: UIColor {
        return UIColor(red: 180 / 255.0, green: 180 / 255.0, blue: 180 / 255.0, alpha: 1)
    }
}
