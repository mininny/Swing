//
//  UIViewController.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

import UIKit

public extension UIViewController {
    static var topViewController: UIViewController? {
        if var topController = UIWindow.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
}
