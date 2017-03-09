//
//  CLLocationCoordinate2DEquatabiltyTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/8/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import CoreLocation
import TestableCoreLocation


class CLLocationCoordinate2DEquatabiltyTests: XCTestCase {

    var otherCoordinate: CLLocationCoordinate2D!
    let latitude = SampleCoordinate.latitude
    let longitude = SampleCoordinate.longitude
    let epsilon = CLLocationDegrees.ulpOfOne
    let doubleEpsilon = CLLocationDegrees.ulpOfOne * 2

    func testIdenticalCoordinatesAreEqual() {
        otherCoordinate = SampleCoordinate
        XCTAssertEqual(otherCoordinate, SampleCoordinate,
                       "Coordinates with identical latitudes and longitudes should be equal")
    }

    func testEpsilonDifferentCoordinatesAreEqual() {
        otherCoordinate = CLLocationCoordinate2D(
            latitude: latitude - epsilon,
            longitude: longitude
        )
        XCTAssertEqual(otherCoordinate, SampleCoordinate,
                       "Coordinates with different latitudes should be unequal")

        otherCoordinate = CLLocationCoordinate2D(
            latitude: latitude + epsilon,
            longitude: longitude
        )
        XCTAssertEqual(otherCoordinate, SampleCoordinate,
                       "Coordinates with different latitudes should be unequal")

        otherCoordinate = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude - epsilon
        )
        XCTAssertEqual(otherCoordinate, SampleCoordinate,
                       "Coordinates with different longitudes should be unequal")

        otherCoordinate = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude + epsilon
        )
        XCTAssertEqual(otherCoordinate, SampleCoordinate,
                       "Coordinates with different longitudes should be unequal")
    }

    func testDoubleEpsilonDifferentCoordinatesAreEqual() {
        otherCoordinate = CLLocationCoordinate2D(
            latitude: latitude - doubleEpsilon,
            longitude: longitude
        )
        XCTAssertEqual(otherCoordinate, SampleCoordinate,
                       "Coordinates with different latitudes should be unequal")

        otherCoordinate = CLLocationCoordinate2D(
            latitude: latitude + doubleEpsilon,
            longitude: longitude
        )
        XCTAssertEqual(otherCoordinate, SampleCoordinate,
                       "Coordinates with different latitudes should be unequal")

        otherCoordinate = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude - doubleEpsilon
        )
        XCTAssertEqual(otherCoordinate, SampleCoordinate,
                       "Coordinates with different longitudes should be unequal")

        otherCoordinate = CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude + doubleEpsilon
        )
        XCTAssertEqual(otherCoordinate, SampleCoordinate,
                       "Coordinates with different longitudes should be unequal")
    }

}
