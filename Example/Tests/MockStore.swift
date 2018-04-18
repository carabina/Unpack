//
//  MockStore.swift
//  Unpack_Tests
//
//  Created by Oren F on 15/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
@testable import Unpack

struct MockStore {
    
    static func getObject() -> MockObject {
        return MockObject(value1: "This is a string value",
                          value2: 2,
                          value3: 3.14,
                          value4: ["hello" : "world"])
    }
    
    static func getJSON() -> JSON {
        return [
            "value1" : "This is a string value",
            "value2" : 2,
            "value3" : 3.14,
            "value4" : ["hello" : "world"]
        ]
    }
    
    static func getData() -> Data {
        guard let data = try? JSONSerialization.data(withJSONObject: getJSON(), options: []) else { return Data() }
        return data
    }
    
    static func getObjectArray() -> [MockObject] {
        return [getObject()]
    }
    
    static func getJSONArray() -> [JSON] {
        return [getJSON()]
    }
    
    static func getDataArray() -> Data {
        let array = getJSONArray()
        guard let data = try? JSONSerialization.data(withJSONObject: array, options: .prettyPrinted) else { return Data() }
        return data
    }
}

struct MockObject: UnPacked {
    let value1: String// = "This is a string value"
    let value2: Int// = 2
    let value3: Double// = 3.14
    let value4: [String : String]// = ["hello" : "world"]
}
