//
//  MutableCLHeadingTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation
import XCTest

class MutableCLHeadingTests: XCTestCase {

    var heading: CLHeading!
    var components = CLHeadingComponentValues3D(0.01, 0.02, 0.03)
    let magneticHeading = CLLocationDirection(0.1)
    let trueHeading = CLLocationDirection(0.15)
    let headingAccuracy = CLLocationDirection(0.01)
    let timestamp = NSDate()

    override func setUp() {
        super.setUp()

        heading = CLHeading(magneticHeading: magneticHeading, trueHeading: trueHeading, headingAccuracy: headingAccuracy, timestamp: timestamp, description: "Sample Heading", rawComponents: components)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCanCreateHeading() {
        XCTAssertEqual(heading.magneticHeading, magneticHeading, "The heading should be created with the provided magnetic heading")
        XCTAssertEqual(heading.trueHeading, trueHeading, "The heading should be created with the provided true heading")
        XCTAssertEqual(heading.headingAccuracy, headingAccuracy, "The heading should be created with the provided heading accuracy")
        XCTAssertEqual(heading.timestamp, timestamp, "The heading should be created with the provided timestamp")
        XCTAssertEqual(heading.description, "Sample Heading", "The heading should be created with the provided description")
        XCTAssertEqual(heading.x, components.x, "The heading should be created with the provided raw components")
        XCTAssertEqual(heading.y, components.y, "The heading should be created with the provided raw components")
        XCTAssertEqual(heading.z, components.z, "The heading should be created with the provided raw components")
    }

    func testMutableMagneticHeading() {
        heading.magneticHeading = -magneticHeading
        XCTAssertEqual(heading.magneticHeading, -magneticHeading, "The heading should allow mutation of its magneticHeading property")
    }

    func testMutableTrueHeading() {
        heading.trueHeading = -trueHeading
        XCTAssertEqual(heading.trueHeading, -trueHeading, "The heading should allow mutation of its trueHeading property")
    }

    func testMutableHeadingAccuracy() {
        heading.headingAccuracy = headingAccuracy * 2.0
        XCTAssertEqual(heading.headingAccuracy, headingAccuracy * 2.0, "The heading should allow mutation of its headingAccuracy property")
    }

    func testMutableTimestamp() {
        heading.timestamp = NSDate.distantFuture() as NSDate
        XCTAssertEqual(heading.timestamp, NSDate.distantFuture() as NSDate, "The heading should allow mutation of its timestamp property")
    }

    func testMutableDescription() {
        heading.description = "New Description"
        XCTAssertEqual(heading.description, "New Description", "The heading should allow mutation of its description property")
    }

    func testMutableXComponent() {
        heading.x = -components.x
        XCTAssertEqual(heading.x, -components.x, "The heading should allow mutation of its x raw component property")
    }

    func testMutableYComponent() {
        heading.y = -components.y
        XCTAssertEqual(heading.y, -components.y, "The heading should allow mutation of its y raw component property")
    }

    func testMutableZComponent() {
        heading.z = -components.z
        XCTAssertEqual(heading.z, -components.z, "The heading should allow mutation of its z raw component property")
    }

}
