//
//  MutableLocationTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import CoreLocation
import TestableCoreLocation


class MutableLocationTests: XCTestCase {

    var location: CLLocation!
    let now = Date()
    var mutableLocation: MutableLocation!

    override func setUp() {
        super.setUp()

        mutableLocation = MutableLocation(
            coordinate: SampleCoordinate,
            altitude: 5280,
            horizontalAccuracy: 14.42,
            verticalAccuracy: 42.14,
            course: 99.44,
            speed: 10.4,
            timestamp: now
        )

        location = mutableLocation
    }

    func testCanCreateMutableLocation() {
        XCTAssertEqual(location.coordinate, SampleCoordinate,
                       "Should be able to create a mutable location with a coordinate")
        XCTAssertEqual(location.altitude, 5280,
                       "Should be able to create a mutable location with an altitude")
        XCTAssertEqual(location.horizontalAccuracy, 14.42,
                       "Should be able to create a mutable location with a horizontal accuracy")
        XCTAssertEqual(location.verticalAccuracy, 42.14,
                       "Should be able to create a mutable location with a vertical accuracy")
        XCTAssertEqual(location.course, 99.44,
                       "Should be able to create a mutable location with a course")
        XCTAssertEqual(location.speed, 10.4,
                       "Should be able to create a mutable location with a speed")
        XCTAssertEqual(location.timestamp, now,
                       "Should be able to create a mutable location with a timestamp")
        XCTAssertNil(location.floor, "User-created locations do not have floors")
    }

    func testCoordinateIsMutable() {
        mutableLocation.coordinate = OtherCoordinate
        XCTAssertEqual(location.coordinate, OtherCoordinate,
                       "Should be able to change the coordinate of a location")
    }

    func testAltitudeIsMutable() {
        mutableLocation.altitude = 13.31
        XCTAssertEqual(location.altitude, 13.31,
                       "Should be able to change the altitude of a location")
    }

    func testHorizontalAccuracyIsMutable() {
        mutableLocation.horizontalAccuracy = 18.48
        XCTAssertEqual(location.horizontalAccuracy, 18.48,
                       "Should be able to change the horizontal accuracy of a location")
    }

    func testVerticalAccuracyIsMutable() {
        mutableLocation.verticalAccuracy = 2.22
        XCTAssertEqual(location.verticalAccuracy, 2.22,
                       "Should be able to change the vertical accuracy of a location")
    }

    func testCourseIsMutable() {
        mutableLocation.course = -88
        XCTAssertEqual(location.course, -88,
                       "Should be able to change the course of a location")
    }

    func testSpeedIsMutable() {
        mutableLocation.speed = 197.82
        XCTAssertEqual(location.speed, 197.82,
                       "Should be able to change the speed of a location")
    }

    func testTimestampIsMutable() {
        mutableLocation.timestamp = .distantPast
        XCTAssertEqual(location.timestamp, .distantPast,
                       "Should be able to change the timestamp of a location")
    }

    func testFloorIsMutable() {
        let floor: CLFloor = MutableFloor(level: 14)
        mutableLocation.floor = floor
        XCTAssertEqual(location.floor, floor, "Should be able to change the floor of a location")
    }

}
