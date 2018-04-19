//
//  Array+Packable.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

extension Array: Packable where Element: Packable {
    
    public static var encoder: JSONEncoder { return Element.encoder }
    
    public func pack() throws -> Data {
        let enc = Element.encoder
        return try enc.encode(self)
    }
    
    public func pack(using encoder: JSONEncoder) throws -> Data {
        return try encoder.encode(self)
    }
    
    public func json() throws -> Any {
        return try json(using: Element.encoder)
    }
    
    public func json(using encoder: JSONEncoder) throws -> Any {
        return try json(using: encoder, options: [.mutableContainers, .allowFragments])
    }
    
    public func json(using encoder: JSONEncoder, options: JSONSerialization.ReadingOptions) throws -> Any {
        let data = try pack(using: encoder)
        return try JSONSerialization.jsonObject(with: data, options: options)
    }
}
