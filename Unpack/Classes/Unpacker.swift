//
//  Unpacker.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 17/04/2018.
//

import Foundation

/// A struct capable of decoding an `Unpackable` object from `Data` of `JSON`
public struct Unpacker<T: Unpackable> {
    
    private(set) public var value: T?
    private(set) public var error: Error?
    private(set) public var decoder: JSONDecoder
    
    public init(decoder: JSONDecoder = T.decoder) {
        self.decoder = decoder
    }
    
    @discardableResult
    public mutating func unpack<U>(package: Package<U>) throws -> T {
        do {
            let val: T
            if let raw = package.rawValue as? Data {
                val = try T.unpack(data: raw)
            } else {
                val = try T.unpack(json: package.rawValue)
            }
            self.value = val
            return val
        }
        catch {
            self.error = error
            throw error
        }
    }

    @discardableResult
    public mutating func unpack(data: Data) throws -> T {
        do {
            let val = try T.unpack(data: data)
            self.value = val
            return val
        }
        catch {
            self.error = error
            throw error
        }
    }
    
    @discardableResult
    public mutating func unpack(json: Any) throws -> T {
        do {
            let val = try T.unpack(json: json)
            self.value = val
            return val
        }
        catch {
            self.error = error
            throw error
        }
    }
}
