//
//  MutableCLFloorTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation
import XCTest

class MutableCLFloorTests: XCTestCase {

    var floor: CLFloor!

    override func setUp() {
        super.setUp()

        floor = CLFloor(level: 14)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCanCreateFloor() {
        XCTAssertEqual(floor.level, 14, "The floor should be created with the provided level")
    }

    func testMutableLevel() {
        floor.level = -4
        XCTAssertEqual(floor.level, -4, "The floor should allow mutation of its floor property")
    }

}
