`MutableBeacon`
===============

Since instances of `CLBeacon` can be neither created nor modified, a subclass called `MutableBeacon` is provided for testing purposes.  Only the "live" values of `proximity`, `accuracy` and `rssi` are mutable.

```swift
class MutableBeacon: CLBeacon {
Identifying the Beacon

    let proximityUUID: UUID
    let major: Int
    let minor: Int
    var proximity: CLProximity
    var accuracy: CLLocationAccuracy
    var rssi: Int

    init(
        proximityUUID: UUID,
        major: Int,
        minor: Int
    )
}
```

The initializer creates a mutable beacon with all-zero values for the properties not provided by parameters.
