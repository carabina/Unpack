//
//  JSON+Unpack.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

extension Dictionary where Key == String, Value == Any {
    
    /// Allows converting a [String : Any] dictionary to an `Unpackable` object
    public func unpack<T: Unpackable>() throws -> T {
        return try T.unpack(json: self)
    }
}

extension Array where Element == JSON {
    
    /// Allows converting a [[String : Any]] dictionary to a `[Unpackable]` object
    public func unpack<T: Unpackable>() throws -> [T] {
        var elements: [T] = []
        for item in self {
            elements.append(try item.unpack())
        }
        return elements
    }
}
