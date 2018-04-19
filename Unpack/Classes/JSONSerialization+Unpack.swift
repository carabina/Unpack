//
//  JSONSerialization+Unpack.swift
//  Pods-Unpack_Tests
//
//  Created by Oren F on 19/04/2018.
//

import Foundation

extension JSONSerialization {
    
    public static var unpackReadingOptions: JSONSerialization.ReadingOptions {
        return [.allowFragments,
                .mutableContainers,
                .mutableLeaves]
    }
    
    public static var unpackWritingOptions: JSONSerialization.WritingOptions {
        return [.prettyPrinted]
    }
}
