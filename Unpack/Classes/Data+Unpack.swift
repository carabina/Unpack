//
//  Data+Unpack.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

extension Data {
    
    /// Allows converting a Data to an `Unpackable` object
    public func unpack<T: Unpackable>() throws -> T {
        return try T.unpack(data: self)
    }
}

extension Array where Element == Data {
    
    /// Allows converting a [Data] dictionary to a `[Unpackable]` object
    public func unpack<T: Unpackable>() throws -> [T] {
        var elements: [T] = []
        for item in self {
            elements.append(try item.unpack())
        }
        return elements
    }
}
