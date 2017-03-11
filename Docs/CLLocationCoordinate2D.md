`CLLocationCoordinate2D`
========================

Equatability of coordinates is provided by comparing the latitude and longitude components.

```swift
extension CLLocationCoordinate2D: Equatable {}

public func ==(
	lhs: CLLocationCoordinate2D, 
	rhs: CLLocationCoordinate2D
) -> Bool
```
