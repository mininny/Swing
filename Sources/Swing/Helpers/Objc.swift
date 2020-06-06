//
//  Objc.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

import Foundation

public class Objc {
    static func set<T>(toObject object: AnyObject, value: T, key: UnsafeRawPointer, policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        objc_setAssociatedObject(object, key, value, policy)
    }
    
    static func set<T>(value: T, key: UnsafeRawPointer, policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        objc_setAssociatedObject(self, key, value, policy)
    }

    static func get<T>(fromObject object: AnyObject, key: UnsafeRawPointer) -> T? {
        return objc_getAssociatedObject(object, key) as? T
    }
    
    static func get<T>(key: UnsafeRawPointer) -> T? {
        return objc_getAssociatedObject(self, key) as? T
    }
}
