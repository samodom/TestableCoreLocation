//
//  MutableFloorTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import CoreLocation
import TestableCoreLocation


class MutableFloorTests: XCTestCase {

    var floor: CLFloor!
    let mutableFloor = MutableFloor(level: 14)

    override func setUp() {
        super.setUp()

        floor = mutableFloor
    }

    func testCanCreateFloor() {
        XCTAssertEqual(floor.level, 14, "Should be able to create a floor with a level")
    }

    func testLevelIsMutable() {
        mutableFloor.level = 42
        XCTAssertEqual(floor.level, 42, "Should be able to change the level of a floor")
    }

    func testInvalidMutableFloorSerialization() {
        let data = NSKeyedArchiver.archivedData(
            withRootObject: CLLocation(
                latitude: SampleCoordinate.latitude,
                longitude: SampleCoordinate.longitude
            )
        )
        let anotherFloor = NSKeyedUnarchiver.unarchiveObject(with: data) as? MutableFloor
        XCTAssertNil(anotherFloor,
                     "Should not be able to deserialize some other object as a mutable floor")
    }

    func testValidMutableFloorSerialization() {
        let data = NSKeyedArchiver.archivedData(withRootObject: floor)
        let anotherFloor = NSKeyedUnarchiver.unarchiveObject(with: data) as? CLFloor
        XCTAssertEqual(anotherFloor!.level, 14,
                       "Should be able to serialize and deserialize a mutable floor")
    }

}
