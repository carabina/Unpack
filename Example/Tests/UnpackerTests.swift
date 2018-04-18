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
    
    func testUnpackerFailure() {
        var json = MockStore.getJSON()
        json["value1"] = nil
        var unpacker = Unpacker<MockObject>()
        _ = try? unpacker.unpack(package: .json(json))
        XCTAssertNil(unpacker.value)
        XCTAssertNotNil(unpacker.error)
    }
    
}
