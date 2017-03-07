`MutableHeading`
================

Since instances of `CLHeading` can be neither created nor modified, a subclass called `MutableHeading` is provided for testing purposes.

```swift
class MutableHeading: CLHeading {
    var magneticHeading: CLLocationDirection { get set }
    var trueHeading: CLLocationDirection { get set }
    var headingAccuracy: CLLocationDirection { get set }
    var timestamp: Date { get set }
    var x: CLHeadingComponentValue { get set }
    var y: CLHeadingComponentValue { get set }
    var z: CLHeadingComponentValue { get set }
    
    init()
}
```

The initializer creates a mutable heading values with all-zero values for its properties (except that `timestamp` is set to the current timestamp).
