//
//  UIWindow.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

import UIKit.UIWindow
import UIKit.UIWindowScene

public extension UIWindow {
    static var keyWindow: UIWindow? { UIApplication.shared.windows.filter {$0.isKeyWindow}.first }
}
