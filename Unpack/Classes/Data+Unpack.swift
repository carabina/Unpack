//
//  Data+Unpack.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

extension Data {
    
    public func unpack<T: Unpackable>() throws -> T {
        return try T.unpack(data: self)
    }
}
