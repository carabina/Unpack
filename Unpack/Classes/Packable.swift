//
//  Packable.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 15/04/2018.
//

import Foundation

public protocol Packable: Encodable {
    
    static var encoder: JSONEncoder { get }
    
    func pack() throws -> Data
    
    func json() throws -> JSON
}

public extension Packable {
    
    static var encoder: JSONEncoder {
        let enc = JSONEncoder()
        enc.dateEncodingStrategy = .secondsSince1970
        enc.dataEncodingStrategy = .base64
        enc.keyEncodingStrategy = .convertToSnakeCase
        return enc
    }
    
    func pack() throws -> Data {
        let enc = Self.encoder
        return try enc.encode(self)
    }
    
    func json() throws -> JSON {
        let data = try pack()
        let object = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
        guard let jsonObject = object as? JSON else {
            throw UnpackableError.wrongType
        }
        return jsonObject
    }

}
