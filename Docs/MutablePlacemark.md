`MutablePlacemark`
==================

Since instances of `CLPlacemark` cannot be modified and cannot be created with most property values, a subclass called `MutablePlacemark` is provided for testing purposes.


```swift
class MutablePlacemark: CLPlacemark {
    var location: CLLocation? { get set }
    var name: String? { get set }
    var addressDictionary: CLGeocoderAddressDictionary? { get set }
    var isoCountryCode: String? { get set }
    var country: String? { get set }
    var postalCode: String? { get set }
    var administrativeArea: String? { get set }
    var subAdministrativeArea: String? { get set }
    var locality: String? { get set }
    var subLocality: String? { get set }
    var thoroughfare: String? { get set }
    var subThoroughfare: String? { get set }
    var region: CLRegion? { get set }
    var timeZone: TimeZone? { get set }
    var inlandWater: String? { get set }
    var ocean: String? { get set }
    var areasOfInterest: [String]? { get set }
}
```
