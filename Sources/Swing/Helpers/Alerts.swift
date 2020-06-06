//
//  Alerts.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/29.
//

#if os(iOS)
import UIKit

class Alerts {
    static func showAlert(title: String, message: String, on vc: UIViewController, options: Options = .init(), completion: (()->Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

        if options.showOK{
            let okAction = UIAlertAction(title: options.defaultTitle, style: .default, handler: nil)
            alert.addAction(okAction)
        }
    
        if options.showCancel {
            let cancelAction = UIAlertAction(title: options.cancelTitle, style: .cancel, handler: nil)
            alert.addAction(cancelAction)
        }

        vc.present(alert, animated: options.animate, completion: completion)
    }
    
//    public enum Option {
//        case defaultTitle(_ title: String = "OK")
//        case cancelTitle(_ title: String = "Cancel")
//        case showCancel(_ show: Bool = true)
//        case showOK(_ show: Bool = true)
//        case animate(_ bool: Bool = true)
//    }
    
    public struct Options {
        var defaultTitle = "OK"
        var cancelTitle = "Cancel"
        var showCancel = true
        var showOK = true
        var animate = true
    }
}

#endif
