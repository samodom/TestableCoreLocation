//
//  CLLocationManager.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation

public class CLLocationManager: CoreLocation.CLLocationManager {

    /*!
        Indicates whether or not the `requestAlwaysAuthorization` method has been called on this object.
    */
    public var requestAlwaysAuthorizationCalled = false

    /*!
        Indicates whether or not the `requestWhenInUseAuthorization` method has been called on this object.
    */
    public var requestWhenInUseAuthorizationCalled = false

    /*!
        Indicates whether or not the `startUpdatingLocation` method has been called on this object.
    */
    public var startUpdatingLocationCalled = false

    /*!
        Indicates whether or not the `stopUpdatingLocation` method has been called on this object.
    */
    public var stopUpdatingLocationCalled = false

    /*!
        Indicates whether or not the `startUpdatingHeading` method has been called on this object.
    */
    public var startUpdatingHeadingCalled = false

    /*!
        Indicates whether or not the `stopUpdatingHeading` method has been called on this object.
    */
    public var stopUpdatingHeadingCalled = false

    /*!
        Indicates whether or not the `dismissHeadingCalibrationDisplay` method has been called on this object.
    */
    public var dismissHeadingCalibrationDisplayCalled = false

    /*!
        Indicates whether or not the `startMonitoringSignificantLocationChanges` method has been called on this object.
    */
    public var startMonitoringSignificantLocationChangesCalled = false

    /*!
        Indicates whether or not the `stopMonitoringSignificantLocationChanges` method has been called on this object.
    */
    public var stopMonitoringSignificantLocationChangesCalled = false

    /*!
        Indicates whether or not the `startMonitoringForRegion:` method has been called on this object.
    */
    public var startMonitoringForRegionCalled = false

    /*!
        Provides the region that was passed to the `startMonitoringForRegion:` method, if called.
    */
    public var startMonitoringForRegionRegion: CLRegion?

    /*!
        Indicates whether or not the `stopMonitoringForRegion:` method has been called on this object.
    */
    public var stopMonitoringForRegionCalled = false

    /*!
        Provides the region that was passed to the `stopMonitoringForRegion:` method, if called.
    */
    public var stopMonitoringForRegionRegion: CLRegion?

    /*!
        Indicates whether or not the `startRangingBeaconsInRegion:` method has been called on this object.
    */
    public var startRangingBeaconsInRegionCalled = false

    /*!
        Provides the region that was passed to the `startRangingBeaconsInRegion:` method, if called.
    */
    public var startRangingBeaconsInRegionRegion: CLBeaconRegion?

    /*!
        Indicates whether or not the `stopRangingBeaconsInRegion:` method has been called on this object.
    */
    public var stopRangingBeaconsInRegionCalled = false

    /*!
        Provides the region that was passed to the `stopRangingBeaconsInRegion:` method, if called.
    */
    public var stopRangingBeaconsInRegionRegion: CLBeaconRegion?

    /*!
        Indicates whether or not the `startMonitoringVisits` method has been called on this object.
    */
    public var startMonitoringVisitsCalled = false

    /*!
        Indicates whether or not the `stopMonitoringVisits` method has been called on this object.
    */
    public var stopMonitoringVisitsCalled = false

    /*!
        Indicates whether or not the `allowDeferredLocationUpdatesUntilTraveled:timeout:` method has been called on this object.
    */
    public var allowDeferredLocationUpdatesCalled = false

    /*!
        Provides the distance traveled criterion that was passed to the `allowDeferredLocationUpdatesUntilTraveled:timeout:` method, if called.
    */
    public var allowDeferredLocationUpdatesDistance: CLLocationDistance?

    /*!
        Provides the timeout that was passed to the `allowDeferredLocationUpdatesUntilTraveled:timeout:` method, if called.
    */
    public var allowDeferredLocationUpdatesTimeout: NSTimeInterval?

    /*!
        Indicates whether or not the `disallowDeferredLocationUpdates` method has been called on this object.
    */
    public var disallowDeferredLocationUpdatesCalled = false


    internal var forwardingList = ShimMethodForwardingList(shouldForwardByDefault: false)

}
