//
//  MutableCLLocationTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation
import XCTest

class MutableCLLocationTests: XCTestCase {

    var location: CLLocation!
    let coordinate = CLLocationCoordinate2D(latitude: 12.123456, longitude: -24.654321)
    let altitude = CLLocationDistance(99.99)
    let floor = CLFloor()
    let horizontalAccuracy = CLLocationAccuracy(14.42)
    let verticalAccuracy = CLLocationAccuracy(5.55)
    let timestamp = NSDate()
    let speed = CLLocationSpeed(1.23)
    let course = CLLocationDirection(-93.3)

    override func setUp() {
        super.setUp()

        location = CLLocation(coordinate: coordinate, altitude: altitude, horizontalAccuracy: horizontalAccuracy, verticalAccuracy: verticalAccuracy, course: course, speed: speed, timestamp: timestamp)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testMutableCoordinate() {
        XCTAssertEqual(location.coordinate, coordinate, "The mutable location should use the provided coordinate")
        let newCoordinate = CLLocationCoordinate2D(latitude: -1.11111, longitude: 1.11111)
        location.coordinate = newCoordinate
        XCTAssertEqual(location.coordinate, newCoordinate, "The location should allow mutation of its coordinate property")
    }

    func testMutableAltitude() {
        XCTAssertEqual(location.altitude, altitude, "The mutable location should use the provided altitude")
        location.altitude = 12.34
        XCTAssertEqual(location.altitude, 12.34, "The location should allow mutation of its altitude property")
    }

    func testMutableFloor() {
        XCTAssertNil(location.floor, "Locations do not have floors by default")
        location.floor = floor
        XCTAssertEqual(location.floor!, floor, "The location should allow mutation of its floor property")
    }

    func testMutableHorizontalAccuracy() {
        XCTAssertEqual(location.horizontalAccuracy, horizontalAccuracy, "The mutable location should use the provided horizontal accuracy")
        location.horizontalAccuracy = 12.34
        XCTAssertEqual(location.horizontalAccuracy, 12.34, "The location should allow mutation of its horizontalAccuracy property")
    }

    func testMutableVerticalAccuracy() {
        XCTAssertEqual(location.verticalAccuracy, verticalAccuracy, "The mutable location should use the provided vertical accuracy")
        location.verticalAccuracy = 12.34
        XCTAssertEqual(location.verticalAccuracy, 12.34, "The location should allow mutation of its verticalAccuracy property")
    }

    func testMutableTimestamp() {
        XCTAssertEqual(location.timestamp, timestamp, "The mutable location should use the provided timestamp")
        location.timestamp = NSDate.distantFuture() as NSDate
        XCTAssertEqual(location.timestamp, NSDate.distantFuture() as NSDate, "The location should allow mutation of its timestamp property")
    }

    func testMutableDescription() {
        XCTAssertGreaterThan(countElements(location.description), 0, "Locations do not have custom descriptions by default")
        location.description = "Sample Location"
        XCTAssertEqual(location.description, "Sample Location", "The location should allow mutation of its description property")
    }

    func testMutableSpeed() {
        XCTAssertEqual(location.speed, speed, "The mutable location should use the provided speed")
        location.speed = 12.34
        XCTAssertEqual(location.speed, 12.34, "The location should allow mutation of its speed property")
    }

    func testMutableCourse() {
        XCTAssertEqual(location.course, course, "The mutable location should use the provided course")
        location.course = 12.34
        XCTAssertEqual(location.course, 12.34, "The location should allow mutation of its course property")
    }

}
