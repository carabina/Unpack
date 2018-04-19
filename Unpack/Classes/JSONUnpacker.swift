//
//  JSONUnpacker.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 18/04/2018.
//

import Foundation

public struct JSONUnpacker<T: Unpackable> {
    
    public let package: Package<Any>
    public let rawValue: Any
    private(set) public var value: T?
    private(set) public var error: Error?
    
    public init(_ value: Any, decoder: JSONDecoder = T.decoder ) {
        self.package = .json(value)
        self.rawValue = value
        self.attemptUnpacking()
    }
    
    private mutating func attemptUnpacking() {
        do {
            self.value = try T.unpack(json: rawValue)
        }
        catch {
            self.error = error
        }
    }
}
