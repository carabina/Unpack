//
//  UnpackableTests.swift
//  Unpack_Tests
//
//  Created by Oren F on 15/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Unpack

class UnpackableTests: XCTestCase {
    
    func testUnpackDataToObject() {
        let data = MockStore.getData()
        let object = try? MockObject.unpack(data: data)
        XCTAssertNotNil(object, "Data should be successfully unpacked to object")
        compare(object: object)
    }

    func testUnpackJSONToObject() {
        let json = MockStore.getJSON()
        let object = try? MockObject.unpack(json: json)
        XCTAssertNotNil(object, "JSON should be successfully unpacked to object")
        compare(object: object)
    }
    
    func testUnpackDataToArray() {
        let data = MockStore.getDataArray()
        let array = try? [MockObject].unpack(data: data)
        let object = array?.first
        XCTAssertNotNil(object, "Data should be successfully unpacked to array of objects")
        XCTAssertEqual(array?.count, 1)
        compare(object: object)
    }
    
    func testUnpackJSONToArray() {
        let json = MockStore.getJSONArray()
        let array = try? [MockObject].unpack(json: json)
        let object = array?.first
        XCTAssertNotNil(object, "JSON should be successfully unpacked to array of objects")
        XCTAssertEqual(array?.count, 1)
        compare(object: object)
    }

    private func compare(object: MockObject?) {
        XCTAssertEqual(object?.value1, "This is a string value")
        XCTAssertEqual(object?.value2, 2)
        XCTAssertEqual(object?.value3, 3.14)
        XCTAssertEqual(object?.value4.keys.first, "hello")
        XCTAssertEqual(object?.value4.values.first, "world")
    }
}
