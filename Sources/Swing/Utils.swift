//
//  Utils.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/29.
//

import Foundation

class Utils {
    static let objc = Objc.self
    #if os(iOS)
    static let alerts = Alerts.self
    static let keyboard = Keyboard()
    #endif
    
    fileprivate init() { }
}
