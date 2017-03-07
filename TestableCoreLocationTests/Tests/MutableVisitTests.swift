//
//  MutableVisitTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import CoreLocation
import TestableCoreLocation


class MutableVisitTests: XCTestCase {

    var visit: CLVisit!
    let mutableVisit = MutableVisit(
        coordinate: SampleCoordinate,
        horizontalAccuracy: 14.42,
        arrivalDate: .distantPast,
        departureDate: .distantFuture
    )
    let now = Date()

    override func setUp() {
        super.setUp()

        visit = mutableVisit
    }

    func testCanCreateVisit() {
        XCTAssertEqual(visit.coordinate, SampleCoordinate,
                       "Should be able to create a visit with a coordinate")
        XCTAssertEqual(visit.horizontalAccuracy, 14.42,
                       "Should be able to create a visit with a horizontal accuracy")
        XCTAssertEqual(visit.arrivalDate, .distantPast,
                       "Should be able to create a visit with an arrival date")
        XCTAssertEqual(visit.departureDate, .distantFuture,
                       "Should be able to create a visit with a departure date")
    }

    func testCoordinateIsMutable() {
        mutableVisit.coordinate = OtherCoordinate
        XCTAssertEqual(visit.coordinate, OtherCoordinate,
                       "Should be able to change the coordinate of a visit")
    }

    func testHorizontalAccuracyIsMutable() {
        mutableVisit.horizontalAccuracy = 99.44
        XCTAssertEqual(visit.horizontalAccuracy, 99.44,
                       "Should be able to change the horizontal accuracy of a visit")
    }

    func testArrivalDateIsMutable() {
        mutableVisit.arrivalDate = now
        XCTAssertEqual(visit.arrivalDate, now,
                       "Should be able to change the arrival date of a visit")
    }

    func testDepartureDateIsMutable() {
        mutableVisit.departureDate = now
        XCTAssertEqual(visit.departureDate, now,
                       "Should be able to change the departure date of a visit")
    }

    func testDepartureDateCanBeSameAsArrivalDate() {
        mutableVisit.arrivalDate = now
        mutableVisit.departureDate = now
        XCTAssertEqual(visit.departureDate, now,
                       "Should be able to set the arrival and departure dates to the same value")
    }

    func testDepartureDateCannotBeBeforeArrivalDate() {
        mutableVisit.arrivalDate = now
        mutableVisit.departureDate = now.addingTimeInterval(-1)
        XCTAssertEqual(visit.departureDate, .distantFuture,
                       "Should not be able to set the departure date to a value before the arrival date")
    }

    func testArrivalDateCanBeSameAsDepartureDate() {
        mutableVisit.departureDate = now
        mutableVisit.arrivalDate = now
        XCTAssertEqual(visit.departureDate, now,
                       "Should be able to set the arrival and departure dates to the same value")
    }

    func testArrivalDateCannotBeAfterDepartureDate() {
        mutableVisit.departureDate = now
        mutableVisit.arrivalDate = now.addingTimeInterval(1)
        XCTAssertEqual(visit.arrivalDate, .distantPast,
                       "Should not be able to set the arrival date to a value after the departure date")
    }

    func testMutableVisitSerialization() {
        let data = NSKeyedArchiver.archivedData(withRootObject: visit)
        let anotherVisit = NSKeyedUnarchiver.unarchiveObject(with: data) as? CLVisit
        XCTAssertEqual(anotherVisit!.coordinate, SampleCoordinate,
                       "Should be able to serialize and deserialize a mutable visit")
        XCTAssertEqual(anotherVisit!.horizontalAccuracy, 14.42,
                       "Should be able to serialize and deserialize a mutable visit")
        XCTAssertEqual(anotherVisit!.arrivalDate, .distantPast,
                       "Should be able to serialize and deserialize a mutable visit")
        XCTAssertEqual(anotherVisit!.departureDate, .distantFuture,
                       "Should be able to serialize and deserialize a mutable visit")
    }

}
