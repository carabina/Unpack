//
//  Package.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

/// A container for a value that is passed to an `Unpacker`
public enum Package<T>: RawRepresentable {
    
    case data(T)
    case json(T)
    
    public typealias RawValue = T
    
    public var rawValue: RawValue {
        switch self {
        case .data(let data):
            return data
        case .json(let json):
            return json
        }
    }
    
    public init?(rawValue: RawValue) {
        if let data = rawValue as? Data {
            self = Package<Data>.data(data) as! Package<T>
        } else if let json = rawValue as? JSON {
            self = Package<JSON>.json(json) as! Package<T>
        }
        return nil
    }
}
