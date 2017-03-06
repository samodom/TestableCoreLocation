`MutableFloor`
==============

Since instances of `CLFloor` can be neither created nor modified, a subclass called `MutableFloor` is provided for testing purposes.

```swift
class MutableFloor: CLFloor {
    var level: Int { get set }
    init(level: Int)
}
```
