//
//  MutableHeading.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation


/// Mutable subclass of `CLHeading` to be used for testing purposes.
open class MutableHeading: CLHeading {

    /// Mutable magnetic heading of a heading.
    private final var _magneticHeading: CLLocationDirection = 0
    open override var magneticHeading: CLLocationDirection {
        get {
            return _magneticHeading
        }
        set {
            _magneticHeading = newValue
        }
    }


    /// Mutable true heading of a heading.
    private final var _trueHeading: CLLocationDirection = 0
    open override var trueHeading: CLLocationDirection {
        get {
            return _trueHeading
        }
        set {
            _trueHeading = newValue
        }
    }


    /// Mutable heading accuracy of a heading.
    private final var _headingAccuracy: CLLocationDirection = .infinity
    open override var headingAccuracy: CLLocationDirection {
        get {
            return _headingAccuracy
        }
        set {
            _headingAccuracy = newValue
        }
    }


    /// Mutable timestamp of a heading.
    private final var _timestamp = Date()
    open override var timestamp: Date {
        get {
            return _timestamp
        }
        set {
            _timestamp = newValue
        }
    }


    /// Mutable x heading component of a heading.
    private final var _x: CLHeadingComponentValue = 0
    open override var x: CLHeadingComponentValue {
        get {
            return _x
        }
        set {
            _x = newValue
        }
    }


    /// Mutable y heading component of a heading.
    private final var _y: CLHeadingComponentValue = 0
    open override var y: CLHeadingComponentValue {
        get {
            return _y
        }
        set {
            _y = newValue
        }
    }


    /// Mutable z heading component of a heading.
    private final var _z: CLHeadingComponentValue = 0
    open override var z: CLHeadingComponentValue {
        get {
            return _z
        }
        set {
            _z = newValue
        }
    }


    public override init() {
        super.init()
    }


    private enum MutableHeadingEncodingKeys {
        static let magneticHeading = "magneticHeading"
        static let trueHeading = "trueHeading"
        static let headingAccuracy = "headingAccuracy"
        static let timestamp = "timestamp"
        static let x = "x"
        static let y = "y"
        static let z = "z"
    }

    required public init?(coder: NSCoder) {
        _magneticHeading = coder.decodeDouble(forKey: MutableHeadingEncodingKeys.magneticHeading)
        _trueHeading = coder.decodeDouble(forKey: MutableHeadingEncodingKeys.trueHeading)
        _headingAccuracy = coder.decodeDouble(forKey: MutableHeadingEncodingKeys.headingAccuracy)

        if let time = coder.decodeObject(forKey: MutableHeadingEncodingKeys.timestamp) as? Date {
            _timestamp = time
        }

        _x = coder.decodeDouble(forKey: MutableHeadingEncodingKeys.x)
        _y = coder.decodeDouble(forKey: MutableHeadingEncodingKeys.y)
        _z = coder.decodeDouble(forKey: MutableHeadingEncodingKeys.z)

        super.init(coder: coder)
    }

    open override func encode(with coder: NSCoder) {
        coder.encode(magneticHeading, forKey: MutableHeadingEncodingKeys.magneticHeading)
        coder.encode(trueHeading, forKey: MutableHeadingEncodingKeys.trueHeading)
        coder.encode(headingAccuracy, forKey: MutableHeadingEncodingKeys.headingAccuracy)
        coder.encode(timestamp, forKey: MutableHeadingEncodingKeys.timestamp)
        coder.encode(x, forKey: MutableHeadingEncodingKeys.x)
        coder.encode(y, forKey: MutableHeadingEncodingKeys.y)
        coder.encode(z, forKey: MutableHeadingEncodingKeys.z)
    }

}
