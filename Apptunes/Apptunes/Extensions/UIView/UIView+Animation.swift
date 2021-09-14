//
//  UIView+Animation.swift
//  Apptunes
//
//  Created by Marwin Carino on 9/14/21.
//

import Foundation
import UIKit

extension UIView {
    func animateShadow(isShown: Bool, timing: CAMediaTimingFunctionName = .default, duration: CFTimeInterval = 0.3, lowValue: Float = 0) {
        let shadowOpacityAnimation = CABasicAnimation()
        shadowOpacityAnimation.fromValue = isShown ? lowValue : self.layer.shadowOpacity
        shadowOpacityAnimation.toValue = isShown ? self.layer.shadowOpacity : lowValue
        shadowOpacityAnimation.isRemovedOnCompletion = false
        shadowOpacityAnimation.fillMode = .forwards
        shadowOpacityAnimation.duration = duration
        shadowOpacityAnimation.timingFunction = CAMediaTimingFunction(name: timing)
        self.layer.add(shadowOpacityAnimation, forKey: "shadowOpacity")
    }
    
    func animateTouchDown(duration: Double = 0.1) {
        self.transform = .identity
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: [.curveEaseOut, .allowUserInteraction],
            animations: { [weak self] in
                self?.transform = .init(scaleX: 0.9, y: 0.9)
            }, completion: nil)
        animateShadow(isShown: false, timing: .easeOut, duration: duration, lowValue: self.layer.shadowOpacity / 3.0)
    }
    
    func animateTouchUp(duration: Double = 0.2) {
        self.transform = .init(scaleX: 0.9, y: 0.9)
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: [.curveEaseOut, .allowUserInteraction],
            animations: { [weak self] in
                self?.transform = .identity
            }, completion: nil)
        animateShadow(isShown: true, timing: .easeOut, duration: duration, lowValue: self.layer.shadowOpacity / 3.0)
    }
}
