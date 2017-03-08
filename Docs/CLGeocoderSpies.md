`CLGeocoder` Spies
==================

These spies forward NO method calls to the original method implementation.

> The `CLGeocoderAddressDictionary` typealias has been created to represent `[AnyHashable: Any]`.


**Direct spies:**

* [`reverseGeocodeLocation(_:completionHandler:)`](#spying-on-reverseGeocodeLocation_completionHandler)
* [`geocodeAddressDictionary(_:completionHandler:)`](#spying-on-geocodeAddressDictionary_completionHandler-and-geocodeAddressString_completionHandler-and-geocodeAddressString_incompletionHandler), [`geocodeAddressString(_:completionHandler:)`](#spying-on-geocodeAddressDictionary_completionHandler-and-geocodeAddressString_completionHandler-and-geocodeAddressString_incompletionHandler) and [`geocodeAddressString(_:in:completionHandler:)`](#spying-on-geocodeAddressDictionary_completionHandler-and-geocodeAddressString_completionHandler-and-geocodeAddressString_incompletionHandler)
* [`cancelGeocode()`](#spying-on-cancelGeocode)


# Spying on `reverseGeocodeLocation(_:completionHandler:)`

Use this spy to validate that a geocoder has been asked to reverse-geocode a location.  The spy controller is named `CLGeocoder.ReverseGeocodeLocationSpyController`.

Three properties provide evidence about a potential method call:

* `var reverseGeocodeLocationCalled: Bool`
* `var reverseGeocodeLocationLocation: CLLocation?`
* `var reverseGeocodeLocationCompletionHandler: CLGeocodeCompletionHandler?`


# Spying on `geocodeAddressDictionary(_:completionHandler:)`, `geocodeAddressString(_:completionHandler:)` and `geocodeAddressString(_:in:completionHandler:)`

Use this spy to validate that a geocoder has been asked to forward-geocode an address.  The spy controller is named `CLGeocoder.ForwardGeocodeAddressSpyController`.

Five properties provide evidence about a potential method call:

* `var forwardGeocodeAddressCalled: Bool`
* `var forwardGeocodeAddressDictionary: CLGeocoderAddressDictionary?`
* `var forwardGeocodeAddressString: String?`
* `var forwardGeocodeAddressRegion: CLRegion?`
* `var forwardGeocodeAddressCompletionHandler: CLGeocodeCompletionHandler?`


# Spying on `cancelGeocode`

Use this spy to validate that a geocoder has been asked to cancel geocoding.  The spy controller is named `CLGeocoder.CancelGeocodeSpyController`.

A single evidence property indicates whether the method was called:

* `var cancelGeocodeCalled: Bool`
