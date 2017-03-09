`MutableLocation`
=================

Since instances of `CLLocation` cannot be modified and cannot be created with a floor, a subclass called `MutableLocation` is provided for testing purposes.

```swift
class MutableLocation: CLLocation {
    var coordinate: CLLocationCoordinate2D { get set }
    var altitude: CLLocationDistance { get set }
    var floor: CLFloor? { get set }
    var horizontalAccuracy: CLLocationAccuracy { get set }
    var verticalAccuracy: CLLocationAccuracy { get set }
    var timestamp: Date { get set }
    var speed: CLLocationSpeed { get set }
    var course: CLLocationDirection { get set }
}
```
