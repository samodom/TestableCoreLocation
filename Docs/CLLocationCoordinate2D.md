`CLLocationCoordinate2D`
========================

Equatability of coordinates is provided by comparing the latitude and longitude components individually with a tolerance of 𝜀.

```swift
extension CLLocationCoordinate2D: Equatable {}
public func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool
```
