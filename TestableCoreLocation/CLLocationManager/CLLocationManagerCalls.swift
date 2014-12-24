//
//  CLLocationManagerCalls.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation

public extension CLLocationManager {

    public override func requestAlwaysAuthorization() {
        requestAlwaysAuthorizationCalled = true

        if shouldForwardMethodCallWithSelector("requestAlwaysAuthorization") {
            super.requestAlwaysAuthorization()
        }
    }

    public override func requestWhenInUseAuthorization() {
        requestWhenInUseAuthorizationCalled = true

        if shouldForwardMethodCallWithSelector("requestWhenInUseAuthorization") {
            super.requestWhenInUseAuthorization()
        }
    }

    public override func startUpdatingLocation() {
        startUpdatingLocationCalled = true

        if shouldForwardMethodCallWithSelector("startUpdatingLocation") {
            super.startUpdatingLocation()
        }
    }

    public override func stopUpdatingLocation() {
        stopUpdatingLocationCalled = true

        if shouldForwardMethodCallWithSelector("stopUpdatingLocation") {
            super.stopUpdatingLocation()
        }
    }

    public override func startUpdatingHeading() {
        startUpdatingHeadingCalled = true

        if shouldForwardMethodCallWithSelector("startUpdatingHeading") {
            super.startUpdatingHeading()
        }
    }

    public override func stopUpdatingHeading() {
        stopUpdatingHeadingCalled = true

        if shouldForwardMethodCallWithSelector("stopUpdatingHeading") {
            super.stopUpdatingHeading()
        }
    }

    public override func dismissHeadingCalibrationDisplay() {
        dismissHeadingCalibrationDisplayCalled = true

        if shouldForwardMethodCallWithSelector("dismissHeadingCalibrationDisplay") {
            super.dismissHeadingCalibrationDisplay()
        }
    }

    public override func startMonitoringSignificantLocationChanges() {
        startMonitoringSignificantLocationChangesCalled = true

        if shouldForwardMethodCallWithSelector("startMonitoringSignificantLocationChanges") {
            super.startMonitoringSignificantLocationChanges()
        }
    }

    public override func stopMonitoringSignificantLocationChanges() {
        stopMonitoringSignificantLocationChangesCalled = true

        if shouldForwardMethodCallWithSelector("stopMonitoringSignificantLocationChanges") {
            super.stopMonitoringSignificantLocationChanges()
        }
    }

    public override func startMonitoringForRegion(region: CLRegion!) {
        startMonitoringForRegionCalled = true
        startMonitoringForRegionRegion = region

        if shouldForwardMethodCallWithSelector("startMonitoringForRegion:") {
            super.startMonitoringForRegion(region)
        }
    }

    public override func stopMonitoringForRegion(region: CLRegion!) {
        stopMonitoringForRegionCalled = true
        stopMonitoringForRegionRegion = region

        if shouldForwardMethodCallWithSelector("stopMonitoringForRegion:") {
            super.stopMonitoringForRegion(region)
        }
    }

    public override func startRangingBeaconsInRegion(region: CLBeaconRegion!) {
        startRangingBeaconsInRegionCalled = true
        startRangingBeaconsInRegionRegion = region

        if shouldForwardMethodCallWithSelector("startRangingBeaconsInRegion:") {
            super.startRangingBeaconsInRegion(region)
        }
    }

    public override func stopRangingBeaconsInRegion(region: CLBeaconRegion!) {
        stopRangingBeaconsInRegionCalled = true
        stopRangingBeaconsInRegionRegion = region

        if shouldForwardMethodCallWithSelector("stopRangingBeaconsInRegion:") {
            super.stopRangingBeaconsInRegion(region)
        }
    }

    public override func startMonitoringVisits() {
        startMonitoringVisitsCalled = true

        if shouldForwardMethodCallWithSelector("startMonitoringVisits") {
            super.startMonitoringVisits()
        }
    }

    public override func stopMonitoringVisits() {
        stopMonitoringVisitsCalled = true

        if shouldForwardMethodCallWithSelector("stopMonitoringVisits") {
            super.stopMonitoringVisits()
        }
    }

    public override func allowDeferredLocationUpdatesUntilTraveled(distance: CLLocationDistance, timeout: NSTimeInterval) {
        allowDeferredLocationUpdatesCalled = true
        allowDeferredLocationUpdatesDistance = distance
        allowDeferredLocationUpdatesTimeout = timeout

        if shouldForwardMethodCallWithSelector("allowDeferredLocationUpdatesUntilTraveled:timeout:") {
            super.allowDeferredLocationUpdatesUntilTraveled(distance, timeout: timeout)
        }
    }

    public override func disallowDeferredLocationUpdates() {
        disallowDeferredLocationUpdatesCalled = true

        if shouldForwardMethodCallWithSelector("disallowDeferredLocationUpdates") {
            super.disallowDeferredLocationUpdates()
        }
    }

}

extension CLLocationManager: ShimMethodForwarding {

    /*!
        The CLLocationManager shim should not forward spied messages by default.
    */
    public var shouldForwardByDefault: Bool { return forwardingList.shouldForwardByDefault }

    /*!
        This method indicates whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method to check for forwarding status.
        :returns: Boolean value indicating whether or not the spy currently forwards calls to the specified method.
    */
    public func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        return forwardingList.shouldForwardMethodCallWithSelector(selector)
    }

    /*!
        Calls to this method control whether or not the spy for the provided selector forwards the method call to the superclass implementation.
        :param: selector Selector of spy method of which to change the forwarding status.
        :param: Boolean value indicating whether or not the method calls should be forwarded.
    */
    public func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        forwardingList.setShouldForwardMethodCallWithSelector(selector, shouldForward)
    }

}
