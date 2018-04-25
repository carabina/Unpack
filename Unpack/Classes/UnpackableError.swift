//
//  UnpackableError.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

/// An error received on unsuccessful "unpacking"
public enum UnpackableError: Error, RawRepresentable, CustomStringConvertible {
    
    case wrongType
    case codable(Error)
    case custom(String)

    // MARK: RawRepresentable
    public typealias RawValue = String
    
    public init?(rawValue: RawValue) {
        self = .custom(rawValue)
    }
    
    public var rawValue: String {
        switch self {
        case .wrongType:
            return ""
        case .codable(let e):
            return e.localizedDescription
        case .custom(let s):
            return s
        }
    }
    
    // MARK: CustomStringConvertible
    public var description: String {
        return rawValue
    }
}
