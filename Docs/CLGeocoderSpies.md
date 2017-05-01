`CLGeocoder` Spies
==================

These spies forward NO method calls to the original method implementation.

> The `CLGeocoderAddressDictionary` typealias has been created to represent `[AnyHashable: Any]`.


**Direct spies:**

* [`reverseGeocodeLocation(_:completionHandler:)`](#spying-on-reversegeocodelocation_completionhandler)
* [`geocodeAddressDictionary(_:completionHandler:)`](#spying-on-geocodeaddressdictionary_completionhandler-geocodeaddressstring_completionhandler-and-geocodeaddressstring_incompletionhandler), [`geocodeAddressString(_:completionHandler:)`](#spying-on-geocodeaddressdictionary_completionhandler-geocodeaddressstring_completionhandler-and-geocodeaddressstring_incompletionhandler) and [`geocodeAddressString(_:in:completionHandler:)`](#spying-on-geocodeaddressdictionary_completionhandler-geocodeaddressstring_completionhandler-and-geocodeaddressstring_incompletionhandler)
* [`cancelGeocode()`](#spying-on-cancelgeocode)

Since geocoders are one-shot objects that don't need to be stored by a caller, they are difficult to capture during testing.  In order to partially remedy this issue, all of the included spy methods (except `cancelGeocode`) capture the geocoder being invoked.  The geocoder is available in the `mostRecentRequestingGeocoder: CLGeocoder?` class property of `CLGeocoder`.  In order to begin spying without an instance, create a dummy geocoder, begin spying and then invoke your geocoder-creating code.  This property is cleared when spying is completed.


## Spying on `reverseGeocodeLocation(_:completionHandler:)`

Use this spy to validate that a geocoder has been asked to reverse-geocode a location.  The spy controller is named `CLGeocoder.ReverseGeocodeLocationSpyController`.

Three properties provide evidence about a potential method call:

* `var reverseGeocodeLocationCalled: Bool`
* `var reverseGeocodeLocationLocation: CLLocation?`
* `var reverseGeocodeLocationCompletionHandler: CLGeocodeCompletionHandler?`


## Spying on `geocodeAddressDictionary(_:completionHandler:)`, `geocodeAddressString(_:completionHandler:)` and `geocodeAddressString(_:in:completionHandler:)`

Use this spy to validate that a geocoder has been asked to forward-geocode an address.  The spy controller is named `CLGeocoder.ForwardGeocodeAddressSpyController`.

Five properties provide evidence about a potential method call:

* `var forwardGeocodeAddressCalled: Bool`
* `var forwardGeocodeAddressDictionary: CLGeocoderAddressDictionary?`
* `var forwardGeocodeAddressString: String?`
* `var forwardGeocodeAddressRegion: CLRegion?`
* `var forwardGeocodeAddressCompletionHandler: CLGeocodeCompletionHandler?`


## Spying on `cancelGeocode`

Use this spy to validate that a geocoder has been asked to cancel geocoding.  The spy controller is named `CLGeocoder.CancelGeocodeSpyController`.

A single evidence property indicates whether the method was called:

* `var cancelGeocodeCalled: Bool`
