//
//  Collection.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

import Foundation

public extension Collection where Indices.Iterator.Element == Index {
    subscript (exists index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

public extension Dictionary where Key: Hashable, Value: AdditiveArithmetic {
    mutating func merge(addingWith dict: [Key: Value]) {
        self.merge(dict) { (lhs, rhs) -> Value in
            return lhs + rhs
        }
    }
}

