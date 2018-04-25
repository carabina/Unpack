//
//  JSONSerialization+Unpack.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

extension JSONSerialization {
    
    /// Default `Unpack` reading options
    public static var unpackReadingOptions: JSONSerialization.ReadingOptions {
        return [.allowFragments, .mutableContainers]
    }
    
    /// Default `Unpack` writing options
    public static var unpackWritingOptions: JSONSerialization.WritingOptions {
        return [.prettyPrinted]
    }
}
