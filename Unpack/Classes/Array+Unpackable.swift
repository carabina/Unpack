//
//  Array+Unpackable.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

extension Array: Unpackable where Element: Unpackable {
    
    public static var decoder: JSONDecoder { return Element.decoder }
    
    public static func unpack(data: Data) throws -> [Element] {
        let json = try JSONSerialization.jsonObject(with: data, options: [])
        return try unpack(json: json)
    }
    
    public static func unpack(json: Any) throws -> [Element] {
        guard let array = json as? [Any] else {
            throw UnpackableError.wrongType
        }
        var elements: [Element] = []
        for e in array {
            let instance = try Element.unpack(json: e)
            elements.append(instance)
        }
        return elements
    }
}
