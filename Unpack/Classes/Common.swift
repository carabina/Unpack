//
//  Common.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 15/04/2018.
//

import Foundation

public typealias UnPacked = Unpackable & Packable
public typealias JSON = [String : Any]



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

public enum UnpackableError: String, Error, CustomStringConvertible {
    case wrongType
    
    public var description: String {
        switch self {
        case .wrongType:
            return "Unexpected object type found"
        }
    }
}
