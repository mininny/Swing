//
//  UIWindow.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

#if os(iOS)
import UIKit

public extension UIWindow {
    static var keyWindow: UIWindow? { UIApplication.shared.windows.filter {$0.isKeyWindow}.first }
}
#endif
