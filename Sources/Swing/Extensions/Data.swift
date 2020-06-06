//
//  Data.swift
//  
//
//  Created by Minhyuk Kim on 2020/04/26.
//

import Foundation

public extension Data {
    var hexString: String { self.map { String(format: "%02x", $0) }.joined() }
}
