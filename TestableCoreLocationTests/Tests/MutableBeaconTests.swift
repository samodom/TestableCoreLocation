//
//  MutableBeaconTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import CoreLocation
import TestableCoreLocation


class MutableBeaconTests: XCTestCase {

    var beacon: CLBeacon!
    var mutableBeacon: MutableBeacon!
    let uuid = UUID()

    override func setUp() {
        super.setUp()

        mutableBeacon = MutableBeacon(
            proximityUUID: uuid,
            major: 14,
            minor: 42
        )

        beacon = mutableBeacon
    }

    func testCanCreateBeacon() {
        XCTAssertEqual(beacon.proximityUUID, uuid,
                       "Should be able to create a beacon with a proximity UUID")
        XCTAssertEqual(beacon.major, 14, "Should be able to create a beacon with a major number")
        XCTAssertEqual(beacon.minor, 42, "Should be able to create a beacon with a minor number")
        XCTAssertEqual(beacon.proximity, .unknown,
                       "Mutable beacons should have unknown proximity by default")
        XCTAssertEqual(beacon.accuracy, 0, "Mutable beacons should have zero accuracy by default")
        XCTAssertEqual(beacon.rssi, 0,
                       "Mutable beacons should have zero signal strength by default")
    }

    func testProximityIsMutable() {
        mutableBeacon.proximity = .near
        XCTAssertEqual(beacon.proximity, .near,
                       "Should be able to change the proximity of a beacon")
    }

    func testAccuracyIsMutable() {
        mutableBeacon.accuracy = 14.42
        XCTAssertEqual(beacon.accuracy, 14.42,
                       "Should be able to change the accuracy of a beacon")
    }

    func testSignalStrengthIsMutable() {
        mutableBeacon.rssi = -9
        XCTAssertEqual(beacon.rssi, -9,
                       "Should be able to change the signal strength of a beacon")
    }

    func testFailedDecoding() {
        let data = NSKeyedArchiver.archivedData(withRootObject: SampleLocation)
        let anotherBeacon = NSKeyedUnarchiver.unarchiveObject(with: data) as? MutableBeacon
        XCTAssertNil(anotherBeacon,
                     "Should not be able to deserialize some other object as a beacon")
    }

    func testMutableBeaconSerialization() {
        mutableBeacon.proximity = .near
        mutableBeacon.accuracy = 14.42
        mutableBeacon.rssi = -9

        let data = NSKeyedArchiver.archivedData(withRootObject: beacon)
        let anotherBeacon = NSKeyedUnarchiver.unarchiveObject(with: data) as? CLBeacon

        XCTAssertEqual(anotherBeacon!.proximityUUID, uuid,
                       "Should be able to serialize and deserialize a mutable beacon")
        XCTAssertEqual(anotherBeacon!.major, 14,
                       "Should be able to serialize and deserialize a mutable beacon")
        XCTAssertEqual(anotherBeacon!.minor, 42,
                       "Should be able to serialize and deserialize a mutable beacon")
        XCTAssertEqual(anotherBeacon!.proximity, .near,
                       "Should be able to serialize and deserialize a mutable beacon")
        XCTAssertEqual(anotherBeacon!.accuracy, 14.42,
                       "Should be able to serialize and deserialize a mutable beacon")
        XCTAssertEqual(anotherBeacon!.rssi, -9,
                       "Should be able to serialize and deserialize a mutable beacon")
    }

}
