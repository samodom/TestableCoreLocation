TestableCoreLocation
====================

This is a framework that uses the same class names as some classes from CoreLocation and extends them using the fully qualified name of the real class. This allows for a shim layer between your application code and CoreLocation **only while testing**.

#### Method spies

- `CLLocationManager`
  - [Capturing instance calls](CLLocationManager.md)


#### Mutable Immutables

- `CLFloor`
- `CLHeading`
- `CLLocation`
- `CLVisit`
