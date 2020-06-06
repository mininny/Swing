//
//  Bundle.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

import Foundation

public extension Bundle {
    var version: String? { self.infoDictionary?["CFBundleShortVersionString"] as? String }
    
    var name: String? { self.infoDictionary?["CFBundleName"] as? String }
    
    var build: String? { self.infoDictionary?["CFBundleVersion"] as? String }
}
