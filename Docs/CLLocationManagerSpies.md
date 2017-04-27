`CLLocationManager` Spies
=========================

These spies forward all method calls to the original method implementation.


**Direct spies:**

* [`requestAlwaysAuthorization`](#spying-on-requestalwaysauthorization)
* [`requestWhenInUseAuthorization`](#spying-on-requestwheninuseauthorization)
* [`requestLocation`](#spying-on-requestlocation)
* [`startUpdatingLocation`](#spying-on-startupdatinglocation)
* [`stopUpdatingLocation`](#spying-on-stopupdatinglocation)
* [`startUpdatingHeading`](#spying-on-startupdatingheading)
* [`stopUpdatingHeading`](#spying-on-stopupdatingheading)
* [`dismissHeadingCalibrationDisplay`](#spying-on-dismissheadingcalibrationdisplay)
* [`startMonitoringSignificantLocationChanges`](#spying-on-startmonitoringsignificantlocationchanges)
* [`stopMonitoringSignificantLocationChanges`](#spying-on-stopmonitoringsignificantlocationchanges)
* [`startMonitoring(for:)`](#spying-on-startmonitoringfor)
* [`stopMonitoring(for:)`](#spying-on-stopmonitoringfor)
* [`startRangingBeacons(in:)`](#spying-on-startrangingbeaconsin)
* [`stopRangingBeacons(in:)`](#spying-on-stoprangingbeaconsin)
* [`startMonitoringVisits`](#spying-on-startmonitoringvisits)
* [`stopMonitoringVisits`](#spying-on-stopmonitoringvisits)
* [`allowDeferredLocationUpdates(untilTraveled:timeout:)`](#spying-on-allowdeferredlocationupdatesuntiltraveledtimeout)
* [`disallowDeferredLocationUpdates`](#spying-on-disallowdeferredlocationupdates)


## Spying on `requestAlwaysAuthorization`

Use this spy to validate that a location manager has been asked to prompt the user for 'always' authorization.  The spy controller is named `CLLocationManager.RequestAlwaysAuthorizationSpyController`.

A single evidence property indicates whether the method was called:

* `var requestAlwaysAuthorizationCalled: Bool`


## Spying on `requestWhenInUseAuthorization`

Use this spy to validate that a location manager has been asked to prompt the user for 'in use' authorization.  The spy controller is named `CLLocationManager.RequestAlwaysAuthorizationSpyController`.

A single evidence property indicates whether the method was called:

* `var requestWhenInUseAuthorizationCalled: Bool`


## Spying on `requestLocation`

Use this spy to validate that a location manager has had the user's location requested.  The spy controller is named `CLLocationManager.RequestLocationSpyController`.

A single evidence property indicates whether the method was called:

* `var requestLocationCalled: Bool`


## Spying on `startUpdatingLocation`

Use this spy to validate that a location manager has been asked to start updating the user's location.  The spy controller is named `CLLocationManager.StartUpdatingLocationSpyController`.

A single evidence property indicates whether the method was called:

* `var startUpdatingLocationCalled: Bool`


## Spying on `stopUpdatingLocation`

Use this spy to validate that a location manager has been asked to stop updating the user's location.  The spy controller is named `CLLocationManager.StopUpdatingLocationSpyController`.

A single evidence property indicates whether the method was called:

* `var stopUpdatingLocationCalled: Bool`


## Spying on `startUpdatingHeading`

Use this spy to validate that a location manager has been asked to start updating the user's heading.  The spy controller is named `CLLocationManager.StartUpdatingHeadingSpyController`.

A single evidence property indicates whether the method was called:

* `var startUpdatingHeadingCalled: Bool`


## Spying on `stopUpdatingHeading`

Use this spy to validate that a location manager has been asked to stop updating the user's heading.  The spy controller is named `CLLocationManager.StopUpdatingHeadingSpyController`.

A single evidence property indicates whether the method was called:

* `var stopUpdatingHeadingCalled: Bool`


## Spying on `dismissHeadingCalibrationDisplay`

Use this spy to validate that a location manager has been asked to dismiss the heading calibration display.  The spy controller is named `CLLocationManager.DismissHeadingCalibrationDisplaySpyController`.

A single evidence property indicates whether the method was called:

* `var dismissHeadingCalibrationDisplayCalled: Bool`


## Spying on `startMonitoringSignificantLocationChanges`

Use this spy to validate that a location manager has been asked to start monitoring the user's location for significant change in location.  The spy controller is named `CLLocationManager.StartMonitoringSignificantLocationChangesSpyController`.

A single evidence property indicates whether the method was called:

* `var startMonitoringSignificantLocationChangesCalled: Bool`


## Spying on `stopMonitoringSignificantLocationChanges`

Use this spy to validate that a location manager has been asked to stop monitoring the user's location for significant change in location.  The spy controller is named `CLLocationManager.StopMonitoringSignificantLocationChangesSpyController`.

A single evidence property indicates whether the method was called:

* `var stopMonitoringSignificantLocationChangesCalled: Bool`


## Spying on `startMonitoring(for:)`

Use this spy to validate that a location manager has been asked to start monitoring a region.  The spy controller is named `CLLocationManager.StartMonitoringForRegionSpyController`.

Two properties provide evidence about a potential method call:

* `var startMonitoringForRegionCalled: Bool`
* `var startMonitoringForRegionRegion: CLRegion?`


## Spying on `stopMonitoring(for:)`

Use this spy to validate that a location manager has been asked to stop monitoring a region.  The spy controller is named `CLLocationManager.StopMonitoringForRegionSpyController`.

Two properties provide evidence about a potential method call:

* `var stopMonitoringForRegionCalled: Bool`
* `var stopMonitoringForRegionRegion: CLRegion?`


## Spying on `startRangingBeacons(in:)`

Use this spy to validate that a location manager has been asked to start ranging beacons in a certain region.  The spy controller is named `CLLocationManager.StartRangingBeaconsSpyController`.

Two properties provide evidence about a potential method call:

* `var startRangingBeaconsCalled: Bool`
* `var startRangingBeaconsRegion: CLBeaconRegion?`


## Spying on `stopRangingBeacons(in:)`

Use this spy to validate that a location manager has been asked to stop ranging beacons in a certain region.  The spy controller is named `CLLocationManager.StopRangingBeaconsSpyController`.

Two properties provide evidence about a potential method call:

* `var stopRangingBeaconsCalled: Bool`
* `var stopRangingBeaconsRegion: CLBeaconRegion?`



## Spying on `startMonitoringVisits`

Use this spy to validate that a location manager has been asked to start monitoring visits.  The spy controller is named `CLLocationManager.StartMonitoringVisitsSpyController`.

A single evidence property indicates whether the method was called:

* `var startMonitoringVisitsCalled: Bool`


## Spying on `stopMonitoringVisits`

Use this spy to validate that a location manager has been asked to stop monitoring visits.  The spy controller is named `CLLocationManager.StopMonitoringVisitsSpyController`.

A single evidence property indicates whether the method was called:

* `var stopMonitoringVisitsCalled: Bool`


## Spying on `allowDeferredLocationUpdates(untilTraveled:timeout:)`

Use this spy to validate that a location manager has been asked to defer the delivery of location updates.  The spy controller is named `CLLocationManager.AllowDeferredLocationUpdatesSpyController`.

Three properties provide evidence about a potential method call:

* `var allowDeferredLocationUpdatesCalled: Bool`
* `var allowDeferredLocationUpdatesDistance: CLLocationDistance?`
* `var allowDeferredLocationUpdatesTimeout: NSTimeInterval?`


## Spying on `disallowDeferredLocationUpdates`

Use this spy to validate that a location manager has been asked to disallow the deferal of the delivery of location updates.  The spy controller is named `CLLocationManager.DisallowDeferredLocationUpdatesSpyController`.

A single evidence property indicates whether the method was called:

* `var disallowDeferredLocationUpdatesCalled: Bool`
