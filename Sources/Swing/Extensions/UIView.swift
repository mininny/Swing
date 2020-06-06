//
//  UIView.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

import UIKit.UIView

public extension UIView {
    func round() {
        guard let side = [self.frame.width, self.frame.height].min() else { return }
        self.layer.cornerRadius = side/2
    }
}
