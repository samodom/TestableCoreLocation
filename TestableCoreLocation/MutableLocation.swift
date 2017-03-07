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

}
