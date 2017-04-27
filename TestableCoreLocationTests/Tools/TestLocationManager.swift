//
//  TestLocationManager.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/5/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation

open class TestLocationManager: CLLocationManager {

    final var requestAlwaysAuthorizationTestMethodCalled = false
    dynamic open override func requestAlwaysAuthorization() {
        requestAlwaysAuthorizationTestMethodCalled = true
    }

    final var requestWhenInUseAuthorizationTestMethodCalled = false
    dynamic open override func requestWhenInUseAuthorization() {
        requestWhenInUseAuthorizationTestMethodCalled = true
    }

    final var startUpdatingLocationTestMethodCalled = false
    dynamic open override func startUpdatingLocation() {
        startUpdatingLocationTestMethodCalled = true
    }

    final var stopUpdatingLocationTestMethodCalled = false
    dynamic open override func stopUpdatingLocation() {
        stopUpdatingLocationTestMethodCalled = true
    }

    final var requestLocationTestMethodCalled = false
    dynamic open override func requestLocation() {
        requestLocationTestMethodCalled = true
    }

    final var startUpdatingHeadingTestMethodCalled = false
    dynamic open override func startUpdatingHeading() {
        startUpdatingHeadingTestMethodCalled = true
    }

    final var stopUpdatingHeadingTestMethodCalled = false
    dynamic open override func stopUpdatingHeading() {
        stopUpdatingHeadingTestMethodCalled = true
    }

    final var dismissHeadingCalibrationDisplayTestMethodCalled = false
    dynamic open override func dismissHeadingCalibrationDisplay() {
        dismissHeadingCalibrationDisplayTestMethodCalled = true
    }

    final var startMonitoringSignificantLocationChangesTestMethodCalled = false
    dynamic open override func startMonitoringSignificantLocationChanges() {
        startMonitoringSignificantLocationChangesTestMethodCalled = true
    }

    final var stopMonitoringSignificantLocationChangesTestMethodCalled = false
    dynamic open override func stopMonitoringSignificantLocationChanges() {
        stopMonitoringSignificantLocationChangesTestMethodCalled = true
    }

    final var startMonitoringForRegionTestMethodCalled = false
    dynamic open override func startMonitoring(for region: CLRegion) {
        startMonitoringForRegionTestMethodCalled = true
    }

    final var stopMonitoringForRegionTestMethodCalled = false
    dynamic open override func stopMonitoring(for region: CLRegion) {
        stopMonitoringForRegionTestMethodCalled = true
    }

    final var startRangingBeaconsInRegionTestMethodCalled = false
    dynamic open override func startRangingBeacons(in region: CLBeaconRegion) {
        startRangingBeaconsInRegionTestMethodCalled = true
    }

    final var stopRangingBeaconsInRegionTestMethodCalled = false
    dynamic open override func stopRangingBeacons(in region: CLBeaconRegion) {
        stopRangingBeaconsInRegionTestMethodCalled = true
    }

    final var startMonitoringVisitsTestMethodCalled = false
    dynamic open override func startMonitoringVisits() {
        startMonitoringVisitsTestMethodCalled = true
    }

    final var stopMonitoringVisitsTestMethodCalled = false
    dynamic open override func stopMonitoringVisits() {
        stopMonitoringVisitsTestMethodCalled = true
    }

    final var allowDeferredLocationUpdatesTestMethodCalled = false
    dynamic open override func allowDeferredLocationUpdates(
        untilTraveled distance: CLLocationDistance,
        timeout: TimeInterval
        ) {

        allowDeferredLocationUpdatesTestMethodCalled = true
    }

    final var disallowDeferredLocationUpdatesTestMethodCalled = false
    dynamic open override func disallowDeferredLocationUpdates() {
        disallowDeferredLocationUpdatesTestMethodCalled = true
    }

}
