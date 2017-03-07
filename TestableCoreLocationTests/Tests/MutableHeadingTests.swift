//
//  MutableHeadingTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import CoreLocation
import TestableCoreLocation


class MutableHeadingTests: XCTestCase {

    var heading: CLHeading!
    let now = Date()
    let mutableHeading = MutableHeading()

    override func setUp() {
        super.setUp()

        heading = mutableHeading
    }

    func testCanCreateHeading() {
        XCTAssertEqual(heading.magneticHeading, 0,
                       "Creating a new heading should do so with a zero-value magnetic heading")
        XCTAssertEqual(heading.trueHeading, 0,
                       "Creating a new heading should do so with a zero-value true heading")
        XCTAssertEqual(heading.headingAccuracy, .infinity,
                       "Creating a new heading should do so with an infinite-value heading accuracy")
        XCTAssertTrue((heading.timestamp.timeIntervalSince1970 - now.timeIntervalSince1970) < 0.1,
                      "Creating a new heading should use the current time for the timestamp")
        XCTAssertEqual(heading.x, 0,
                       "Creating a new heading should do so with a zero-value x heading component")
        XCTAssertEqual(heading.y, 0,
                       "Creating a new heading should do so with a zero-value y heading component")
        XCTAssertEqual(heading.z, 0,
                       "Creating a new heading should do so with a zero-value z heading component")
    }

    func testMagneticHeadingIsMutable() {
        mutableHeading.magneticHeading = 14.42
        XCTAssertEqual(heading.magneticHeading, 14.42,
                       "Should be able to change the magnetic heading of a mutable heading")
    }

    func testTrueHeadingIsMutable() {
        mutableHeading.trueHeading = 14.42
        XCTAssertEqual(heading.trueHeading, 14.42,
                       "Should be able to change the true heading of a mutable heading")
    }

    func testHeadingAccuracyIsMutable() {
        mutableHeading.headingAccuracy = 14.42
        XCTAssertEqual(heading.headingAccuracy, 14.42,
                       "Should be able to change the heading accuracy of a mutable heading")
    }

    func testTimestampIsMutable() {
        let later = Date()
        mutableHeading.timestamp = later
        XCTAssertEqual(heading.timestamp, later,
                       "Should be able to change the timestamp of a mutable heading")
    }

    func testXHeadingComponentIsMutable() {
        mutableHeading.x = 14.42
        XCTAssertEqual(heading.x, 14.42,
                       "Should be able to change the x-heading-component of a mutable heading")
    }

    func testYHeadingComponentIsMutable() {
        mutableHeading.y = 14.42
        XCTAssertEqual(heading.y, 14.42,
                       "Should be able to change the y-heading-component of a mutable heading")
    }

    func testZHeadingComponentIsMutable() {
        mutableHeading.z = 14.42
        XCTAssertEqual(heading.z, 14.42,
                       "Should be able to change the z-heading-component of a mutable heading")
    }


    func testInvalidMutableHeadingSerialization() {
        let data = NSKeyedArchiver.archivedData(withRootObject: SampleLocation)
        let anotherHeading = NSKeyedUnarchiver.unarchiveObject(with: data) as? MutableHeading
        XCTAssertNil(anotherHeading,
                     "Should not be able to deserialize some other object as a mutable heading")
    }

    func testValidMutableHeadingSerialization() {
        mutableHeading.magneticHeading = 12
        mutableHeading.trueHeading = 34
        mutableHeading.headingAccuracy = 56
        mutableHeading.timestamp = now
        mutableHeading.x = 1
        mutableHeading.y = 2
        mutableHeading.z = 3

        let data = NSKeyedArchiver.archivedData(withRootObject: heading)
        let anotherHeading = NSKeyedUnarchiver.unarchiveObject(with: data) as? CLHeading
        XCTAssertEqual(anotherHeading!.magneticHeading, 12,
                       "Should be able to serialize and deserialize a mutable heading")
        XCTAssertEqual(anotherHeading!.trueHeading, 34,
                       "Should be able to serialize and deserialize a mutable heading")
        XCTAssertEqual(anotherHeading!.headingAccuracy, 56,
                       "Should be able to serialize and deserialize a mutable heading")
        XCTAssertEqual(anotherHeading!.timestamp, now,
                       "Should be able to serialize and deserialize a mutable heading")
        XCTAssertEqual(anotherHeading!.x, 1,
                       "Should be able to serialize and deserialize a mutable heading")
        XCTAssertEqual(anotherHeading!.y, 2,
                       "Should be able to serialize and deserialize a mutable heading")
        XCTAssertEqual(anotherHeading!.z, 3,
                       "Should be able to serialize and deserialize a mutable heading")
    }


}
