//
//  DataUnpacker.swift
//  Unpack_Tests
//
//  Created by Oren F on 18/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct DataUnpacker<T: Unpackable> {
    
    public let package: Package<Data>
    public let rawValue: Data
    private(set) public var value: T?
    private(set) public var error: Error?
    
    init(_ type: Package<Data>, decoder: JSONDecoder = T.decoder ) {
        self.package = type
        self.rawValue = type.rawValue
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
