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

    func testInvalidCoordinatesAreNotEquatable() {
        let sampleCoordinate = CLLocationCoordinate2D(latitude: 10, longitude: 180)
        let otherCoordinate = CLLocationCoordinate2D(latitude: 10, longitude: 180 + 180.ulp)

        XCTAssertNotEqual(sampleCoordinate, otherCoordinate,
                          "Invalid coordinates should not be equal to any coordinate")
        XCTAssertNotEqual(otherCoordinate, sampleCoordinate,
                          "Invalid coordinates should not be equal to any coordinate")
        XCTAssertNotEqual(otherCoordinate, otherCoordinate,
                          "Invalid coordinates should not be equal to any coordinate")
    }

    func testNonAntimeridianCoordinateEquality() {
        DegreeSize.allSizes.forEach { degreeSize in
            let sampleCoordinate = degreeSize.coordinate
            degreeSize.coordinatesAroundDegreeSize(equivalent: true).forEach { coordinate in
                XCTAssertEqual(sampleCoordinate, coordinate,
                               "Coordinates with identical latitudes and longitudes should be equal")
            }
        }
    }

    func testNonAntimeridianCoordinateInequality() {
        DegreeSize.allSizes.forEach { degreeSize in
            let sampleCoordinate = degreeSize.coordinate
            degreeSize.coordinatesAroundDegreeSize(equivalent: false).forEach { coordinate in
                XCTAssertNotEqual(sampleCoordinate, coordinate,
                                  "Coordinates 1 ULP apart from one another in either axis should not be equal")
            }
        }
    }


    // MARK: - Antimeridian

    let positiveAntimeridianCoordinate = CLLocationCoordinate2D(latitude: 10, longitude: 180)
    let negativeAntimeridianCoordinate = CLLocationCoordinate2D(latitude: 10, longitude: -180)

    func testAntimeridianCoordinateEquality() {
        XCTAssertEqual(positiveAntimeridianCoordinate, negativeAntimeridianCoordinate,
                       "The antimeridian should be equatable with 180 or -180")
    }

    func testAntimeridianCoordinateInequality() {
        let withinOneUlp = [
            CLLocationCoordinate2D(latitude: 10, longitude: 180 - 180.ulp),
            CLLocationCoordinate2D(latitude: 10, longitude: -180 + 180.ulp)
        ]

        [positiveAntimeridianCoordinate, negativeAntimeridianCoordinate].forEach { coordinate in
            withinOneUlp.forEach { nearby in
                XCTAssertNotEqual(coordinate, nearby,
                                  "Coordinates 1 ULP apart from one another on the antimeridian should not be equal")
            }
        }
    }

}
