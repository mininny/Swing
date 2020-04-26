//
//  String.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

import Foundation

public extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localized(comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    mutating func removeExcept(count: Int) {
        if self.count > count {
            self.removeLast(self.count - count)
        } else {
            self = ""
        }
    }
    
    var condensed: String? {
        let trimmed = self.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return trimmed.isEmpty ? nil : trimmed
    }
}
