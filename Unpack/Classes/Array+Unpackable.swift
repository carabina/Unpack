//
//  Array+Unpackable.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

/// Extension to allow arrays of `Unpackable` to have the same functionality as their elements
extension Array: Unpackable where Element: Unpackable {
    
    public static var decoder: JSONDecoder { return Element.decoder }
    
    public static func unpack(data: Data) throws -> [Element] {
        return try unpack(data: data, using: decoder)
    }
    
    public static func unpack(data: Data, using decoder: JSONDecoder) throws -> [Element] {
        return try decoder.decode([Element].self, from: data)
    }
    
    public static func unpack(json: Any) throws -> [Element] {
        return try unpack(json: json, using: decoder)
    }
    
    public static func unpack(json: Any, using decoder: JSONDecoder) throws -> [Element] {
        return try unpack(json: json, using: decoder, options: JSONSerialization.unpackWritingOptions)
    }
    
    public static func unpack(json: Any, using decoder: JSONDecoder, options: JSONSerialization.WritingOptions) throws -> [Element] {
        guard let elements = json as? [Any] else {
            throw UnpackableError.wrongType
        }
        var array: [Element] = []
        for element in elements {
            let instance = try Element.unpack(json: element, using: decoder, options: options)
            array.append(instance)
        }
        return array
    }
}
