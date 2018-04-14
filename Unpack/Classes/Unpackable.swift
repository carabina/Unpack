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
    
    static func unpack(json: JSON) throws -> Self
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
    
    static func unpack(json: JSON) throws -> Self {
        let data = try JSONSerialization.data(withJSONObject: json, options: [])
        return try unpack(data: data)
    }
}
