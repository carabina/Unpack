//
//  DataUnpacker.swift
//  Unpack_Tests
//
//  Created by Oren F on 18/04/2018.
//

import Foundation

public struct DataUnpacker<T: Unpackable> {
    
    public let package: Package<Data>
    public let rawValue: Data
    private(set) public var value: T?
    private(set) public var error: Error?
    
    public init(_ value: Data, decoder: JSONDecoder = T.decoder ) {
        self.package = .data(value)
        self.rawValue = value
        self.attemptUnpacking()
    }
    
    private mutating func attemptUnpacking() {
        do {
            self.value = try T.unpack(data: rawValue)
        }
        catch {
            self.error = error
        }
    }
}
