//
//  MutableCLVisitTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation
import XCTest

class MutableCLVisitTests: XCTestCase {

    var visit: CLVisit!
    let coordinate = CLLocationCoordinate2D(latitude: 12.1234, longitude: -24.4321)
    let horizontalAccuracy = CLLocationAccuracy(10.5)
    let timestamp = NSDate()

    override func setUp() {
        super.setUp()

        visit = CLVisit(coordinate: coordinate, horizontalAccuracy: horizontalAccuracy, arrivalDate: timestamp, departureDate: timestamp)
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testCanCreateVisit() {
        XCTAssertEqual(visit.coordinate, coordinate, "The visit should be created with the provided coordinate")
        XCTAssertEqual(visit.horizontalAccuracy, horizontalAccuracy, "The visit should be created with the provided horizontal accuracy")
        XCTAssertEqual(visit.arrivalDate, timestamp, "The visit should be created with the provided arrival date")
        XCTAssertEqual(visit.departureDate, timestamp, "The visit should be created with the provided departure date")
    }

    func testMutableCoordinate() {
        let newCoordinate = CLLocationCoordinate2D(latitude: 1.111, longitude: -1.111)
        visit.coordinate = newCoordinate
        XCTAssertEqual(visit.coordinate, newCoordinate, "The visit should allow mutation of its coordinate")
    }

    func testMutableHorizontalAccuracy() {
        visit.horizontalAccuracy = 4.42
        XCTAssertEqual(visit.horizontalAccuracy, CLLocationAccuracy(4.42), "The visit should allow mutation of its horizontal accuracy")
    }

    func testMutableArrivalDate() {
        visit.arrivalDate = NSDate.distantFuture() as NSDate
        XCTAssertEqual(visit.arrivalDate, NSDate.distantFuture() as NSDate, "The visit should allow mutation of its arrival date")
    }

    func testMutableDepartureDate() {
        visit.departureDate = NSDate.distantFuture() as NSDate
        XCTAssertEqual(visit.departureDate, NSDate.distantFuture() as NSDate, "The visit should allow mutation of its departure date")
    }

}
