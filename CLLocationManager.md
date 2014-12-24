### Capturing calls to `CLLocationManager` methods

Each of the methods below have spy method equivalents that capture the calls to the method and any parameters, if available.  The properties listed below the method names list the new properties of `CLLocationManager` that you can use to validate method calls.

`requestAlwaysAuthorization`
- `var requestAlwaysAuthorizationCalled: Bool`

`requestWhenInUseAuthorization`
- `var requestWhenInUseAuthorizationCalled: Bool`

`startUpdatingLocation`
 - `var startUpdatingLocationCalled: Bool`

`stopUpdatingLocation`
- `var stopUpdatingLocationCalled: Bool`

`startUpdatingHeading`
- `var startUpdatingHeadingCalled: Bool`

`stopUpdatingHeading`
- `var stopUpdatingHeadingCalled: Bool`

`dismissHeadingCalibrationDisplay`
- `var dismissHeadingCalibrationDisplayCalled: Bool`

`startMonitoringSignificantLocationChanges`
- `var startMonitoringSignificantLocationChangesCalled: Bool`

`stopMonitoringSignificantLocationChanges`
- `var stopMonitoringSignificantLocationChangesCalled: Bool`

`startMonitoringForRegion:`
- `var startMonitoringForRegionCalled: Bool`
- `var startMonitoringForRegionRegion: CLRegion?`

`stopMonitoringForRegion:`
- `var stopMonitoringForRegionCalled: Bool`
- `var stopMonitoringForRegionRegion: CLRegion?`

`startRangingBeaconsInRegion:`
- `var startRangingBeaconsInRegionCalled: Bool`
- `var startRangingBeaconsInRegionRegion: CLBeaconRegion?`

`stopRangingBeaconsInRegion:`
- `var stopRangingBeaconsInRegionCalled: Bool`
- `var stopRangingBeaconsInRegionRegion: CLBeaconRegion?`

`startMonitoringVisits`
- `var startMonitoringVisitsCalled: Bool`

`stopMonitoringVisits`
- `var stopMonitoringVisitsCalled: Bool`

`allowDeferredLocationUpdatesUntilTraveled:timeout:`
- `var allowDeferredLocationUpdatesCalled: Bool`
- `var allowDeferredLocationUpdatesDistance: CLLocationDistance?`
- `var allowDeferredLocationUpdatesTimeout: NSTimeInterval?`

`disallowDeferredLocationUpdates`
- `var disallowDeferredLocationUpdatesCalled: Bool`


> After capturing the call to the method, these spies DO NOT forward the call to the superclass (real) implementation.  If you would like for any of these spies to forward the method call to the superclass implementation, simply insert the following call at the beginning of your test with an appropriate selector:
>
> `locator.setShouldForwardMethodCallWithSelector("startUpdatingLocation", true)`
>
> This can be reversed in your test at any time by another call to the same method with the value `false`.
