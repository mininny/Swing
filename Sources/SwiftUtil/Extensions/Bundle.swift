//
//  Bundle.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

import Foundation

public extension Bundle {
    var version: String? { Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String }
    
    var name: String? { Bundle.main.infoDictionary?["CFBundleName"] as? String }
    
    var build: String? { Bundle.main.infoDictionary?["CFBundleVersion"] as? String }
}
