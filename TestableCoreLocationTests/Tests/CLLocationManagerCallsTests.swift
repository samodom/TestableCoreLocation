//
//  CLLocationManagerCallsTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation
import XCTest

class CLLocationManagerCallsTests: XCTestCase {

    let manager = CLLocationManager()
    let center = CLLocationCoordinate2D(latitude: 12.1234, longitude: 24.4321)
    var region: CLRegion!
    var beaconRegion: CLBeaconRegion!

    override func setUp() {
        super.setUp()

        region = CLCircularRegion(center: center, radius: 14.42, identifier: "circle")
        beaconRegion = CLBeaconRegion(circularRegionWithCenter: center, radius: 14.42, identifier: "beacons")
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testShimMethodForwarding() {
        XCTAssertFalse(manager.shouldForwardByDefault, "This shim should not forward methods by default")
        XCTAssertFalse(manager.shouldForwardMethodCallWithSelector("someSelector"), "The method should not be forwarded by default")
        manager.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(manager.shouldForwardMethodCallWithSelector("someSelector"), "The method should now be forwarded")
        manager.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(manager.shouldForwardMethodCallWithSelector("someSelector"), "The method should no longer be forwarded")
    }

    func testRequestAlwaysAuthorizationCall() {
        XCTAssertFalse(manager.requestAlwaysAuthorizationCalled, "The location manager should not indicate having had requestAlwaysAuthorization called by default")
        manager.requestAlwaysAuthorization()
        XCTAssertTrue(manager.requestAlwaysAuthorizationCalled, "The location manager should now indicate having had requestAlwaysAuthorization called")
    }

    func testRequestWhenInUseAuthorizationCall() {
        XCTAssertFalse(manager.requestWhenInUseAuthorizationCalled, "The location manager should not indicate having had requestWhenInUseAuthorization called by default")
        manager.requestWhenInUseAuthorization()
        XCTAssertTrue(manager.requestWhenInUseAuthorizationCalled, "The location manager should now indicate having had requestWhenInUseAuthorization called")
    }

    func testStartUpdatingLocationCall() {
        XCTAssertFalse(manager.startUpdatingLocationCalled, "The location manager should not indicate having had startUpdatingLocation called by default")
        manager.startUpdatingLocation()
        XCTAssertTrue(manager.startUpdatingLocationCalled, "The location manager should now indicate having had startUpdatingLocation called")
    }

    func testStopUpdatingLocationCall() {
        XCTAssertFalse(manager.stopUpdatingLocationCalled, "The location manager should not indicate having had stopUpdatingLocation called by default")
        manager.stopUpdatingLocation()
        XCTAssertTrue(manager.stopUpdatingLocationCalled, "The location manager should now indicate having had stopUpdatingLocation called")
    }

    func testStartUpdatingHeadingCall() {
        XCTAssertFalse(manager.startUpdatingHeadingCalled, "The location manager should not indicate having had startUpdatingHeading called by default")
        manager.startUpdatingHeading()
        XCTAssertTrue(manager.startUpdatingHeadingCalled, "The location manager should now indicate having had startUpdatingHeading called")
    }

    func testStopUpdatingHeadingCall() {
        XCTAssertFalse(manager.stopUpdatingHeadingCalled, "The location manager should not indicate having had stopUpdatingHeading called by default")
        manager.stopUpdatingHeading()
        XCTAssertTrue(manager.stopUpdatingHeadingCalled, "The location manager should now indicate having had stopUpdatingHeading called")
    }

    func testDismissHeadingCalibrationDisplayCall() {
        XCTAssertFalse(manager.dismissHeadingCalibrationDisplayCalled, "The location manager should not indicate having had dismissHeadingCalibrationDisplay called by default")
        manager.dismissHeadingCalibrationDisplay()
        XCTAssertTrue(manager.dismissHeadingCalibrationDisplayCalled, "The location manager should now indicate having had dismissHeadingCalibrationDisplay called")
    }

    func testStartMonitoringSignificantLocationChangesCall() {
        XCTAssertFalse(manager.startMonitoringSignificantLocationChangesCalled, "The location manager should not indicate having had startMonitoringSignificantLocationChanges called by default")
        manager.startMonitoringSignificantLocationChanges()
        XCTAssertTrue(manager.startMonitoringSignificantLocationChangesCalled, "The location manager should now indicate having had startMonitoringSignificantLocationChanges called")
    }

    func testStopMonitoringSignificantLocationChangesCall() {
        XCTAssertFalse(manager.stopMonitoringSignificantLocationChangesCalled, "The location manager should not indicate having had stopMonitoringSignificantLocationChanges called by default")
        manager.stopMonitoringSignificantLocationChanges()
        XCTAssertTrue(manager.stopMonitoringSignificantLocationChangesCalled, "The location manager should now indicate having had stopMonitoringSignificantLocationChanges called")
    }

    func testStartMonitoringForRegionCall() {
        XCTAssertFalse(manager.startMonitoringForRegionCalled, "The location manager should not indicate having had startMonitoringForRegion called by default")
        XCTAssertNil(manager.startMonitoringForRegionRegion, "The region should be missing by default")
        manager.startMonitoringForRegion(region)
        XCTAssertTrue(manager.startMonitoringForRegionCalled, "The location manager should now indicate having had startMonitoringForRegion called")
        XCTAssertEqual(manager.startMonitoringForRegionRegion!, region, "The region should be captured")
    }

    func testStopMonitoringForRegionCall() {
        XCTAssertFalse(manager.stopMonitoringForRegionCalled, "The location manager should not indicate having had stopMonitoringForRegion called by default")
        XCTAssertNil(manager.stopMonitoringForRegionRegion, "The region should be missing by default")
        manager.stopMonitoringForRegion(region)
        XCTAssertTrue(manager.stopMonitoringForRegionCalled, "The location manager should now indicate having had stopMonitoringForRegion called")
        XCTAssertEqual(manager.stopMonitoringForRegionRegion!, region, "The region should be captured")
    }

    func testStartRangingBeaconsInRegionCall() {
        XCTAssertFalse(manager.startRangingBeaconsInRegionCalled, "The location manager should not indicate having had startRangingBeaconsInRegion called by default")
        XCTAssertNil(manager.startRangingBeaconsInRegionRegion, "The region should be missing by default")
        manager.startRangingBeaconsInRegion(beaconRegion)
        XCTAssertTrue(manager.startRangingBeaconsInRegionCalled, "The location manager should now indicate having had startRangingBeaconsInRegion called")
        XCTAssertEqual(manager.startRangingBeaconsInRegionRegion!, beaconRegion, "The region should be captured")
    }

    func testStopRangingBeaconsInRegionCall() {
        XCTAssertFalse(manager.stopRangingBeaconsInRegionCalled, "The location manager should not indicate having had stopRangingBeaconsInRegion called by default")
        XCTAssertNil(manager.stopRangingBeaconsInRegionRegion, "The region should be missing by default")
        manager.stopRangingBeaconsInRegion(beaconRegion)
        XCTAssertTrue(manager.stopRangingBeaconsInRegionCalled, "The location manager should now indicate having had stopRangingBeaconsInRegion called")
        XCTAssertEqual(manager.stopRangingBeaconsInRegionRegion!, beaconRegion, "The region should be captured")
    }

    func testStartMonitoringVisitsCall() {
        XCTAssertFalse(manager.startMonitoringVisitsCalled, "The location manager should not indicate having had startMonitoringVisits called by default")
        manager.startMonitoringVisits()
        XCTAssertTrue(manager.startMonitoringVisitsCalled, "The location manager should now indicate having had startMonitoringVisits called")
    }

    func testStopMonitoringVisitsCall() {
        XCTAssertFalse(manager.stopMonitoringVisitsCalled, "The location manager should not indicate having had stopMonitoringVisits called by default")
        manager.stopMonitoringVisits()
        XCTAssertTrue(manager.stopMonitoringVisitsCalled, "The location manager should now indicate having had stopMonitoringVisits called")
    }

    func testAllowDeferredLocationUpdatesCall() {
        XCTAssertFalse(manager.allowDeferredLocationUpdatesCalled, "The location manager should not indicate having had allowDeferredLocationUpdates called by default")
        XCTAssertNil(manager.allowDeferredLocationUpdatesDistance, "The distance should be missing by default")
        XCTAssertNil(manager.allowDeferredLocationUpdatesTimeout, "The timeout should be missing by default")
        manager.allowDeferredLocationUpdatesUntilTraveled(14.42, timeout: 9.99)
        XCTAssertTrue(manager.allowDeferredLocationUpdatesCalled, "The location manager should now indicate having had allowDeferredLocationUpdates called")
        XCTAssertEqual(manager.allowDeferredLocationUpdatesDistance!, 14.42, "The distance should be captured")
        XCTAssertEqual(manager.allowDeferredLocationUpdatesTimeout!, 9.99, "The timeout should be captured")
    }

    func testDisallowDeferredLocationUpdatesCall() {
        XCTAssertFalse(manager.disallowDeferredLocationUpdatesCalled, "The location manager should not indicate having had disallowDeferredLocationUpdates called by default")
        manager.disallowDeferredLocationUpdates()
        XCTAssertTrue(manager.disallowDeferredLocationUpdatesCalled, "The location manager should now indicate having had disallowDeferredLocationUpdates called")
    }

}
