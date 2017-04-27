//
//  CLLocationManagerSpiesTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/5/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import CoreLocation
import TestableCoreLocation


class CLLocationManagerSpiesTests: XCTestCase {

    let manager = TestLocationManager()


    // MARK: - `requestAlwaysAuthorization`

    func testSpyingOnRequestAlwaysAuthorization() {
        XCTAssertFalse(CLLocationManager.RequestAlwaysAuthorizationSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.requestAlwaysAuthorizationCalled,
                       "By default the location manager should not indicate having been asked to request 'always' authorization")

        let spy = CLLocationManager.RequestAlwaysAuthorizationSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.requestAlwaysAuthorization()

        XCTAssertTrue(manager.requestAlwaysAuthorizationCalled,
                      "The location manager should indicate having been asked to request 'always' authorization")
        XCTAssertFalse(manager.requestAlwaysAuthorizationTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.requestAlwaysAuthorizationCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `requestWhenInUseAuthorization`

    func testSpyingOnRequestWhenInUseAuthorization() {
        XCTAssertFalse(CLLocationManager.RequestWhenInUseAuthorizationSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.requestWhenInUseAuthorizationCalled,
                       "By default the location manager should not indicate having been asked to request 'when in use' authorization")

        let spy = CLLocationManager.RequestWhenInUseAuthorizationSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.requestWhenInUseAuthorization()

        XCTAssertTrue(manager.requestWhenInUseAuthorizationCalled,
                      "The location manager should indicate having been asked to request 'when in use' authorization")
        XCTAssertFalse(manager.requestWhenInUseAuthorizationTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.requestWhenInUseAuthorizationCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `startUpdatingLocation`

    func testSpyingOnStartUpdatingLocation() {
        XCTAssertFalse(CLLocationManager.StartUpdatingLocationSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.startUpdatingLocationCalled,
                       "By default the location manager should not indicate having been asked to start updating the user's location")

        let spy = CLLocationManager.StartUpdatingLocationSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.startUpdatingLocation()

        XCTAssertTrue(manager.startUpdatingLocationCalled,
                      "The location manager should indicate having been asked to start updating the user's location")
        XCTAssertFalse(manager.startUpdatingLocationTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.startUpdatingLocationCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `stopUpdatingLocation`

    func testSpyingOnStopUpdatingLocation() {
        XCTAssertFalse(CLLocationManager.StopUpdatingLocationSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.stopUpdatingLocationCalled,
                       "By default the location manager should not indicate having been asked to stop updating the user's location")

        let spy = CLLocationManager.StopUpdatingLocationSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.stopUpdatingLocation()

        XCTAssertTrue(manager.stopUpdatingLocationCalled,
                      "The location manager should indicate having been asked to stop updating the user's location")
        XCTAssertFalse(manager.stopUpdatingLocationTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.stopUpdatingLocationCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `requestLocation`

    func testSpyingOnRequestLocation() {
        XCTAssertFalse(CLLocationManager.RequestLocationSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.requestLocationCalled,
                       "By default the location manager should not indicate having received a location request")

        let spy = CLLocationManager.RequestLocationSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.requestLocation()

        XCTAssertTrue(manager.requestLocationCalled,
                      "The location manager should indicate having received a location request")
        XCTAssertFalse(manager.requestLocationTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.requestLocationCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `startUpdatingHeading`

    func testSpyingOnStartUpdatingHeading() {
        XCTAssertFalse(CLLocationManager.StartUpdatingHeadingSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.startUpdatingHeadingCalled,
                       "By default the location manager should not indicate having been asked to start updating the user's heading")

        let spy = CLLocationManager.StartUpdatingHeadingSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.startUpdatingHeading()

        XCTAssertTrue(manager.startUpdatingHeadingCalled,
                      "The location manager should indicate having been asked to start updating the user's heading")
        XCTAssertFalse(manager.startUpdatingHeadingTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.startUpdatingHeadingCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `stopUpdatingHeading`

    func testSpyingOnStopUpdatingHeading() {
        XCTAssertFalse(CLLocationManager.StopUpdatingHeadingSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.stopUpdatingHeadingCalled,
                       "By default the location manager should not indicate having been asked to stop updating the user's heading")

        let spy = CLLocationManager.StopUpdatingHeadingSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.stopUpdatingHeading()

        XCTAssertTrue(manager.stopUpdatingHeadingCalled,
                      "The location manager should indicate having been asked to stop updating the user's heading")
        XCTAssertFalse(manager.stopUpdatingHeadingTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.stopUpdatingHeadingCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `dismissHeadingCalibrationDisplay`

    func testSpyingOnDismissHeadingCalibrationDisplay() {
        XCTAssertFalse(CLLocationManager.DismissHeadingCalibrationDisplaySpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.dismissHeadingCalibrationDisplayCalled,
                       "By default the location manager should not indicate having been asked to dismiss the heading calibration display")

        let spy = CLLocationManager.DismissHeadingCalibrationDisplaySpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.dismissHeadingCalibrationDisplay()

        XCTAssertTrue(manager.dismissHeadingCalibrationDisplayCalled,
                      "The location manager should indicate having been asked to dismiss the heading calibration display")
        XCTAssertFalse(manager.dismissHeadingCalibrationDisplayTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.dismissHeadingCalibrationDisplayCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `startMonitoringSignificantLocationChanges`

    func testSpyingOnStartMonitoringSignificantLocationChanges() {
        XCTAssertFalse(CLLocationManager.StartMonitoringSignificantLocationChangesSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.startMonitoringSignificantLocationChangesCalled,
                       "By default the location manager should not indicate having been asked to start monitoring the user's location for significant changes")

        let spy = CLLocationManager.StartMonitoringSignificantLocationChangesSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.startMonitoringSignificantLocationChanges()

        XCTAssertTrue(manager.startMonitoringSignificantLocationChangesCalled,
                      "The location manager should indicate having been asked to start monitoring the user's location for significant changes")
        XCTAssertFalse(manager.startMonitoringSignificantLocationChangesTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.startMonitoringSignificantLocationChangesCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `stopMonitoringSignificantLocationChanges`

    func testSpyingOnStopMonitoringSignificantLocationChanges() {
        XCTAssertFalse(CLLocationManager.StopMonitoringSignificantLocationChangesSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.stopMonitoringSignificantLocationChangesCalled,
                       "By default the location manager should not indicate having been asked to stop monitoring the user's location for significant changes")

        let spy = CLLocationManager.StopMonitoringSignificantLocationChangesSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.stopMonitoringSignificantLocationChanges()

        XCTAssertTrue(manager.stopMonitoringSignificantLocationChangesCalled,
                      "The location manager should indicate having been asked to stop monitoring the user's location for significant changes")
        XCTAssertFalse(manager.stopMonitoringSignificantLocationChangesTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.stopMonitoringSignificantLocationChangesCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `startMonitoring(for:)`

    func testSpyingOnStartMonitoringForRegion() {
        XCTAssertFalse(CLLocationManager.StartMonitoringForRegionSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.startMonitoringForRegionCalled,
                       "By default the location manager should not indicate having been asked to start monitoring for a particular region")
        XCTAssertNil(manager.startMonitoringForRegionRegion,
                     "The should be no captured region by default")

        let spy = CLLocationManager.StartMonitoringForRegionSpyController.createSpy(on: manager)!
        spy.beginSpying()

        let region = CLRegion()
        manager.startMonitoring(for: region)

        XCTAssertTrue(manager.startMonitoringForRegionCalled,
                      "The location manager should indicate having been asked to start monitoring for a particular region")
        XCTAssertFalse(manager.startMonitoringForRegionTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")
        XCTAssertEqual(manager.startMonitoringForRegionRegion, region,
                       "The region should be captured")

        spy.endSpying()

        XCTAssertFalse(manager.startMonitoringForRegionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(manager.startMonitoringForRegionRegion,
                     "The region should be cleared after spying is complete")
    }


    // MARK: - `stopMonitoring(for:)`

    func testSpyingOnStopMonitoringForRegion() {
        XCTAssertFalse(CLLocationManager.StopMonitoringForRegionSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.stopMonitoringForRegionCalled,
                       "By default the location manager should not indicate having been asked to stop monitoring for a particular region")
        XCTAssertNil(manager.stopMonitoringForRegionRegion,
                     "The should be no captured region by default")

        let spy = CLLocationManager.StopMonitoringForRegionSpyController.createSpy(on: manager)!
        spy.beginSpying()

        let region = CLRegion()
        manager.stopMonitoring(for: region)

        XCTAssertTrue(manager.stopMonitoringForRegionCalled,
                      "The location manager should indicate having been asked to stop monitoring for a particular region")
        XCTAssertFalse(manager.stopMonitoringForRegionTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")
        XCTAssertEqual(manager.stopMonitoringForRegionRegion, region,
                       "The region should be captured")

        spy.endSpying()

        XCTAssertFalse(manager.stopMonitoringForRegionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(manager.stopMonitoringForRegionRegion,
                     "The region should be cleared after spying is complete")
    }


    // MARK: - `startRangingBeacons(in:)`

    func testSpyingOnStartRangingBeaconsInRegion() {
        XCTAssertFalse(CLLocationManager.StartRangingBeaconsInRegionSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.startRangingBeaconsInRegionCalled,
                       "By default the location manager should not indicate having been asked to start ranging beacons in a particular region")
        XCTAssertNil(manager.startRangingBeaconsInRegionRegion,
                     "The should be no captured region by default")

        let spy = CLLocationManager.StartRangingBeaconsInRegionSpyController.createSpy(on: manager)!
        spy.beginSpying()

        let region = CLBeaconRegion(proximityUUID: UUID(), identifier: "foo")
        manager.startRangingBeacons(in: region)

        XCTAssertTrue(manager.startRangingBeaconsInRegionCalled,
                      "The location manager should indicate having been asked to start ranging beacons in a particular region")
        XCTAssertFalse(manager.startRangingBeaconsInRegionTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")
        XCTAssertEqual(manager.startRangingBeaconsInRegionRegion, region,
                       "The region should be captured")

        spy.endSpying()

        XCTAssertFalse(manager.startRangingBeaconsInRegionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(manager.startRangingBeaconsInRegionRegion,
                     "The region should be cleared after spying is complete")
    }


    // MARK: - `stopRangingBeacons(in:)`

    func testSpyingOnStopRangingBeaconsInRegion() {
        XCTAssertFalse(CLLocationManager.StopRangingBeaconsInRegionSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.stopRangingBeaconsInRegionCalled,
                       "By default the location manager should not indicate having been asked to stop ranging beacons in a particular region")
        XCTAssertNil(manager.stopRangingBeaconsInRegionRegion,
                     "The should be no captured region by default")

        let spy = CLLocationManager.StopRangingBeaconsInRegionSpyController.createSpy(on: manager)!
        spy.beginSpying()

        let region = CLBeaconRegion(proximityUUID: UUID(), identifier: "foo")
        manager.stopRangingBeacons(in: region)

        XCTAssertTrue(manager.stopRangingBeaconsInRegionCalled,
                      "The location manager should indicate having been asked to stop ranging beacons in a particular region")
        XCTAssertFalse(manager.stopRangingBeaconsInRegionTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")
        XCTAssertEqual(manager.stopRangingBeaconsInRegionRegion, region,
                       "The region should be captured")

        spy.endSpying()

        XCTAssertFalse(manager.stopRangingBeaconsInRegionCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(manager.stopRangingBeaconsInRegionRegion,
                     "The region should be cleared after spying is complete")
    }


    // MARK: - `startMonitoringVisits`

    func testSpyingOnStartMonitoringVisits() {
        XCTAssertFalse(CLLocationManager.StartMonitoringVisitsSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.startMonitoringVisitsCalled,
                       "By default the location manager should not indicate having been asked to start monitoring user visits")

        let spy = CLLocationManager.StartMonitoringVisitsSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.startMonitoringVisits()

        XCTAssertTrue(manager.startMonitoringVisitsCalled,
                      "The location manager should indicate having been asked to start monitoring user visits")
        XCTAssertFalse(manager.startMonitoringVisitsTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.startMonitoringVisitsCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `stopMonitoringVisits`

    func testSpyingOnStopMonitoringVisits() {
        XCTAssertFalse(CLLocationManager.StopMonitoringVisitsSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.stopMonitoringVisitsCalled,
                       "By default the location manager should not indicate having been asked to stop monitoring user visits")

        let spy = CLLocationManager.StopMonitoringVisitsSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.stopMonitoringVisits()

        XCTAssertTrue(manager.stopMonitoringVisitsCalled,
                      "The location manager should indicate having been asked to stop monitoring user visits")
        XCTAssertFalse(manager.stopMonitoringVisitsTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.stopMonitoringVisitsCalled,
                       "The flag should be cleared after spying is complete")
    }


    // MARK: - `allowDeferredLocationUpdates(untilTraveled:timeout:)`

    func testSpyingOnAllowDeferredLocationUpdates() {
        XCTAssertFalse(CLLocationManager.AllowDeferredLocationUpdatesSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.allowDeferredLocationUpdatesCalled,
                       "By default the location manager should not indicate having been asked to allow deferred location updates")
        XCTAssertNil(manager.allowDeferredLocationUpdatesDistance,
                     "The should be no captured distance by default")
        XCTAssertNil(manager.allowDeferredLocationUpdatesTimeout,
                     "The should be no captured timeout by default")

        let spy = CLLocationManager.AllowDeferredLocationUpdatesSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.allowDeferredLocationUpdates(untilTraveled: 14.42, timeout: 42.14)

        XCTAssertTrue(manager.allowDeferredLocationUpdatesCalled,
                      "The location manager should indicate having been asked to allow deferred location updates")
        XCTAssertFalse(manager.allowDeferredLocationUpdatesTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")
        XCTAssertEqual(manager.allowDeferredLocationUpdatesDistance, 14.42,
                       "The distance should be captured")
        XCTAssertEqual(manager.allowDeferredLocationUpdatesTimeout, 42.14,
                       "The timeout should be captured")

        spy.endSpying()

        XCTAssertFalse(manager.allowDeferredLocationUpdatesCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(manager.allowDeferredLocationUpdatesDistance,
                     "The distance should be cleared after spying is complete")
        XCTAssertNil(manager.allowDeferredLocationUpdatesTimeout,
                     "The timeout should be cleared after spying is complete")
    }


    // MARK: - `disallowDeferredLocationUpdates`

    func testSpyingOnDisallowDeferredLocationUpdates() {
        XCTAssertFalse(CLLocationManager.DisallowDeferredLocationUpdatesSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(manager.disallowDeferredLocationUpdatesCalled,
                       "By default the location manager should not indicate having been asked to disallow deferred location updates")

        let spy = CLLocationManager.DisallowDeferredLocationUpdatesSpyController.createSpy(on: manager)!
        spy.beginSpying()

        manager.disallowDeferredLocationUpdates()

        XCTAssertTrue(manager.disallowDeferredLocationUpdatesCalled,
                      "The location manager should indicate having been asked to disallow deferred location updates")
        XCTAssertFalse(manager.disallowDeferredLocationUpdatesTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(manager.disallowDeferredLocationUpdatesCalled,
                       "The flag should be cleared after spying is complete")
    }
    
}
