//
//  JSON+Unpack.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    
    public func unpack<T: Unpackable>() throws -> T {
        return try T.unpack(json: self)
    }
}
