//
//  UnpackerTests.swift
//  Unpack_Tests
//
//  Created by Oren F on 17/04/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
@testable import Unpack

class UnpackerTests: XCTestCase {

    func testUnpackerDataToObject() {
        let data = MockStore.getData()
        var unpacker = Unpacker<MockObject>()
        _ = try? unpacker.unpack(package: .data(data))
        XCTAssertNotNil(unpacker.value)
        XCTAssertNil(unpacker.error)
    }
    
    func testUnpackerJSONTOObject() {
        let json = MockStore.getJSON()
        var unpacker = Unpacker<MockObject>()
        _ = try? unpacker.unpack(package: .json(json))
        XCTAssertNotNil(unpacker.value)
        XCTAssertNil(unpacker.error)
    }
    
    func testDataUnpacker() {
        let data = MockStore.getDataArray()
        let unpacker = DataUnpacker<[MockObject]>(data)
        let array = unpacker.value
        XCTAssertNotNil(array)
        XCTAssertEqual(array?.count, 1)
    }
    
    func testJSONUnpacker() {
        let json = MockStore.getJSONArray()
        let unpacker = JSONUnpacker<[MockObject]>(json)
        let array = unpacker.value
        XCTAssertNotNil(array)
        XCTAssertEqual(array?.count, 1)
    }

    func testUnpackerFailure() {
        var json = MockStore.getJSON()
        json["value1"] = nil
        var unpacker = Unpacker<MockObject>()
        _ = try? unpacker.unpack(package: .json(json))
        XCTAssertNil(unpacker.value)
        XCTAssertNotNil(unpacker.error)
    }
}
