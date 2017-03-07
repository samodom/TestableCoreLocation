//
//  MutableLocation.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation

open class MutableLocation: CLLocation {

    /// Mutable coordinate of a location.
    private final var _coordinate: CLLocationCoordinate2D?
    open override var coordinate: CLLocationCoordinate2D {
        get {
            return _coordinate ?? super.coordinate
        }
        set {
            _coordinate = newValue
        }
    }


    /// Mutable altitude of a location.
    private final var _altitude: CLLocationDistance?
    open override var altitude: CLLocationDistance {
        get {
            return _altitude ?? super.altitude
        }
        set {
            _altitude = newValue
        }
    }


    /// Mutable horizontal accuracy of a location.
    private final var _horizontalAccuracy: CLLocationAccuracy?
    open override var horizontalAccuracy: CLLocationAccuracy {
        get {
            return _horizontalAccuracy ?? super.horizontalAccuracy
        }
        set {
            _horizontalAccuracy = newValue
        }
    }


    /// Mutable vertical accuracy of a location.
    private final var _verticalAccuracy: CLLocationAccuracy?
    open override var verticalAccuracy: CLLocationAccuracy {
        get {
            return _verticalAccuracy ?? super.verticalAccuracy
        }
        set {
            _verticalAccuracy = newValue
        }
    }


    /// Mutable timestamp of a location.
    private final var _timestamp: Date?
    open override var timestamp: Date {
        get {
            return _timestamp ?? super.timestamp
        }
        set {
            _timestamp = newValue
        }
    }


    /// Mutable course of a location.
    private final var _course: CLLocationDirection?
    open override var course: CLLocationDirection {
        get {
            return _course ?? super.course
        }
        set {
            _course = newValue
        }
    }


    /// Mutable speed of a location.
    private final var _speed: CLLocationSpeed?
    open override var speed: CLLocationSpeed {
        get {
            return _speed ?? super.speed
        }
        set {
            _speed = newValue
        }
    }


    /// Mutable floor of a location.
    private final var _floor: CLFloor?
    open override var floor: CLFloor? {
        get {
            return _floor ?? super.floor
        }
        set {
            _floor = newValue
        }
    }


    /// Override of simple coordinate initializer.
    public override init(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        super.init(latitude: latitude, longitude: longitude)
    }


    /// Override of stationary location initializer.
    public override init(
        coordinate: CLLocationCoordinate2D,
        altitude: CLLocationDistance,
        horizontalAccuracy: CLLocationAccuracy,
        verticalAccuracy: CLLocationAccuracy,
        timestamp: Date
        ) {

        super.init(
            coordinate: coordinate,
            altitude: altitude,
            horizontalAccuracy: horizontalAccuracy,
            verticalAccuracy: verticalAccuracy,
            timestamp: timestamp
        )
    }


    /// Override of mobile location initializer.
    public override init(
        coordinate: CLLocationCoordinate2D,
        altitude: CLLocationDistance,
        horizontalAccuracy: CLLocationAccuracy,
        verticalAccuracy: CLLocationAccuracy,
        course: CLLocationDirection,
        speed: CLLocationSpeed,
        timestamp: Date
        ) {

        super.init(
            coordinate: coordinate,
            altitude: altitude,
            horizontalAccuracy: horizontalAccuracy,
            verticalAccuracy: verticalAccuracy,
            course: course,
            speed: speed,
            timestamp: timestamp
        )
    }


    private enum MutableLocationEncodingKeys {
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let altitude = "altitude"
        static let horizontalAccuracy = "horizontalAccuracy"
        static let verticalAccuracy = "verticalAccuracy"
        static let timestamp = "timestamp"
        static let course = "course"
        static let speed = "speed"
        static let floor = "floor"
    }

    public required init?(coder: NSCoder) {
        if coder.containsValue(forKey: MutableLocationEncodingKeys.latitude),
            coder.containsValue(forKey: MutableLocationEncodingKeys.longitude) {
            _coordinate = CLLocationCoordinate2D(
                latitude: coder.decodeDouble(forKey: MutableLocationEncodingKeys.latitude),
                longitude: coder.decodeDouble(forKey: MutableLocationEncodingKeys.longitude)
            )
        }

        if coder.containsValue(forKey: MutableLocationEncodingKeys.altitude) {
            _altitude = coder.decodeDouble(forKey: MutableLocationEncodingKeys.altitude)
        }

        if coder.containsValue(forKey: MutableLocationEncodingKeys.horizontalAccuracy) {
            _horizontalAccuracy = coder.decodeDouble(
                forKey: MutableLocationEncodingKeys.horizontalAccuracy
            )
        }

        if coder.containsValue(forKey: MutableLocationEncodingKeys.verticalAccuracy) {
            _verticalAccuracy = coder.decodeDouble(
                forKey: MutableLocationEncodingKeys.verticalAccuracy
            )
        }

        if coder.containsValue(forKey: MutableLocationEncodingKeys.timestamp),
            let time = coder.decodeObject(forKey: MutableLocationEncodingKeys.timestamp) as? Date {
            _timestamp = time
        }

        if coder.containsValue(forKey: MutableLocationEncodingKeys.course) {
            _course = coder.decodeDouble(forKey: MutableLocationEncodingKeys.course)
        }

        if coder.containsValue(forKey: MutableLocationEncodingKeys.speed) {
            _speed = coder.decodeDouble(forKey: MutableLocationEncodingKeys.speed)
        }

        if coder.containsValue(forKey: MutableLocationEncodingKeys.floor) {
            _floor = coder.decodeObject(forKey: MutableLocationEncodingKeys.floor) as? CLFloor
        }

        super.init(coder: coder)
    }

    open override func encode(with coder: NSCoder) {
        super.encode(with: coder)

        if let overriddenCoordinate = _coordinate {
            coder.encode(
                overriddenCoordinate.latitude,
                forKey: MutableLocationEncodingKeys.latitude
            )
            coder.encode(
                overriddenCoordinate.longitude,
                forKey: MutableLocationEncodingKeys.longitude
            )
        }

        if let overriddenAltitude = _altitude {
            coder.encode(overriddenAltitude, forKey: MutableLocationEncodingKeys.altitude)
        }

        if let overriddenHorizontalAccuracy = _horizontalAccuracy {
            coder.encode(
                overriddenHorizontalAccuracy,
                forKey: MutableLocationEncodingKeys.horizontalAccuracy
            )
        }

        if let overriddenVerticalAccuracy = _verticalAccuracy {
            coder.encode(
                overriddenVerticalAccuracy,
                forKey: MutableLocationEncodingKeys.verticalAccuracy
            )
        }

        if let overriddenAltitude = _timestamp {
            coder.encode(overriddenAltitude, forKey: MutableLocationEncodingKeys.timestamp)
        }

        if let overriddenCourse = _course {
            coder.encode(overriddenCourse, forKey: MutableLocationEncodingKeys.course)
        }

        if let overriddenSpeed = _speed {
            coder.encode(overriddenSpeed, forKey: MutableLocationEncodingKeys.speed)
        }

        if let overriddenFloor = _floor {
            coder.encode(overriddenFloor, forKey: MutableLocationEncodingKeys.floor)
        }
    }

}
