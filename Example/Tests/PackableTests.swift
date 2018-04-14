//
//  PackableTests.swift
//  Unpack_Tests
//
//  Created by Oren F on 15/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Unpack

class PackableTests: XCTestCase {
    
    func testPackObjectToData() {
        let object = MockStore.getObject()
        let data = try? object.pack()
        XCTAssertNotNil(data, "Object should be successfully packed to data")
    }
    
    func testPackObjectToJSON() {
        let object = MockStore.getObject()
        let json = try? object.json()
        XCTAssertNotNil(json, "Object should be successfully packed to JSON")
        XCTAssert(json is JSON)
    }
    
    func testPackArrayToData() {
        let array = MockStore.getObjectArray()
        let data = try? array.pack()
        XCTAssertNotNil(data, "Array should be successfully packed to data")
    }
    
    func testPackArrayToJSON() {
        let array = MockStore.getObjectArray()
        let json = try? array.json()
        XCTAssertNotNil(json, "Array should be successfully packed to JSON")
        XCTAssert(json is [JSON])
    }

}
