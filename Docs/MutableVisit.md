`MutableVisit`
=============

Since instances of `CLVisit` can be neither (truly) created nor modified, a subclass called `MutableVisit` is provided for testing purposes.

```swift
class MutableVisit: CLVisit {
    var coordinate: CLLocationCoordinate2D { get set }
    var horizontalAccuracy: CLLocationAccuracy { get set }
    var arrivalDate: Date { get set }
    var departureDate: Date { get set }

    init(
        coordinate: CLLocationCoordinate2D,
        horizontalAccuracy: CLLocationAccuracy,
        arrivalDate: Date,
        departureDate: Date
    )
}
```
