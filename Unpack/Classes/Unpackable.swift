//
//  Unpackable.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 15/04/2018.
//

import Foundation

public protocol Unpackable: Decodable {
    
    static var decoder: JSONDecoder { get }
    
    static func unpack(data: Data) throws -> Self
    
    static func unpack(json: Any) throws -> Self
}

public extension Unpackable {
    
    static var decoder: JSONDecoder {
        let dec = JSONDecoder()
        dec.dateDecodingStrategy = .secondsSince1970
        dec.dataDecodingStrategy = .base64
        dec.keyDecodingStrategy = .convertFromSnakeCase
        return dec
    }
    
    static func unpack(data: Data) throws -> Self {
        let dec = decoder
        return try dec.decode(Self.self, from: data)
    }
    
    static func unpack(json: Any) throws -> Self {
        let data = try JSONSerialization.data(withJSONObject: json, options: [])
        return try unpack(data: data)
    }
}

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
