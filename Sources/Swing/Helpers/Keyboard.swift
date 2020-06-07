//
//  Keyboard.swift
//  
//
//  Created by Minhyuk Kim on 2020/05/04.
//

#if os(iOS)
import UIKit

public class Keyboard {
    public enum KeyboardKeys {
        case keyBoardHeight
        case animationDuration
        case animationCurve
        case endFrame
    }
    
    public typealias KeyboardHeightHandler = (([KeyboardKeys: Any])->Void)
    
    var keyBoardNotificationHandler: KeyboardHeightHandler?
    
    func startObserving(_ handler: @escaping KeyboardHeightHandler) {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardNotification(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        self.keyBoardNotificationHandler = handler
    }
    
    @objc func keyboardNotification(notification: NSNotification) {
        var keyboardInfo = [KeyboardKeys: Any]()
        
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            keyboardInfo[.endFrame] = endFrame
            
            let duration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
            keyboardInfo[.animationDuration] = duration
            
            let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
            let animationCurve = UIView.AnimationOptions(rawValue: animationCurveRaw)
            keyboardInfo[.animationCurve] = animationCurve
            
            keyboardInfo[.keyBoardHeight] = endFrame?.size.height
        }
        
        self.keyBoardNotificationHandler?(keyboardInfo)
    }
    
    func stopObserving() {
        NotificationCenter.default.removeObserver(self)
        self.keyBoardNotificationHandler = nil
    }
    
    static func addKeyboardObserver(show showAction: Selector? = nil, hide hideAction: Selector? = nil, onObserver observer: Any) {
        if let action = showAction {
            NotificationCenter.default.addObserver(observer, selector: action, name: UIWindow.keyboardWillShowNotification, object: nil)
        }
        
        if let action = hideAction {
            NotificationCenter.default.addObserver(observer, selector: action, name: UIWindow.keyboardWillHideNotification, object: nil)
        }
    }
}

#endif
