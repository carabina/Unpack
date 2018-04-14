//
//  Common.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 15/04/2018.
//

import Foundation

public typealias UnPacked = Unpackable & Packable
public typealias JSON = [String : Any]


public enum UnpackableError: Error, CustomStringConvertible {
    case wrongType
    
    public var description: String {
        switch self {
        case .wrongType:
            return "Unexpected object type found"
        }
    }
}
