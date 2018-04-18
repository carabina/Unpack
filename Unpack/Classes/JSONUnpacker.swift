//
//  JSONUnpacker.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 18/04/2018.
//

import Foundation

struct JSONUnpacker<T: Unpackable> {
    
    public let package: Package<JSON>
    public let rawValue: JSON
    private(set) public var value: T?
    private(set) public var error: Error?
    
    init(_ type: Package<JSON>, decoder: JSONDecoder = T.decoder ) {
        self.package = type
        self.rawValue = type.rawValue
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
