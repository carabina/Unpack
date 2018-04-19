//
//  Unpackable.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 15/04/2018.
//

import Foundation

public func unpack<T: Unpackable>(data: Data) throws -> T {
    return try T.unpack(data: data)
}

public func unpack<T: Unpackable>(json: Any) throws -> T {
    return try T.unpack(json: json)
}

public protocol Unpackable: Decodable {
    
    static var decoder: JSONDecoder { get }
    
    static func unpack(data: Data) throws -> Self
    static func unpack(data: Data, using decoder: JSONDecoder) throws -> Self

    static func unpack(json: Any) throws -> Self
    static func unpack(json: Any, using decoder: JSONDecoder) throws -> Self
    static func unpack(json: Any, using decoder: JSONDecoder, options: JSONSerialization.WritingOptions) throws -> Self
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
        return try unpack(data: data, using: Self.decoder)
    }
    
    static func unpack(data: Data, using decoder: JSONDecoder) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
    
    static func unpack(json: Any) throws -> Self {
        return try unpack(json: json, using: decoder)
    }
    
    static func unpack(json: Any, using decoder: JSONDecoder) throws -> Self {
        return try unpack(json: json, using: decoder, options: JSONSerialization.unpackWritingOptions)
    }
    
    static func unpack(json: Any, using decoder: JSONDecoder, options: JSONSerialization.WritingOptions) throws -> Self {
        let data = try JSONSerialization.data(withJSONObject: json, options: options)
        return try unpack(data: data)
    }
}
