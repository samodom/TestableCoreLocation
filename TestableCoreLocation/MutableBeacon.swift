//
//  MutableBeacon.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation


open class MutableBeacon: CLBeacon {

    /// Mutable proximity of a beacon.
    private final var _proximity = CLProximity.unknown
    open override var proximity: CLProximity {
        get {
            return _proximity
        }
        set {
            _proximity = newValue
        }
    }


    /// Mutable accuracy of a beacon.
    private final var _accuracy: CLLocationAccuracy = 0
    open override var accuracy: CLLocationAccuracy {
        get {
            return _accuracy
        }
        set {
            _accuracy = newValue
        }
    }


    /// Mutable signal strength of a beacon.
    private final var _rssi = 0
    open override var rssi: Int {
        get {
            return _rssi
        }
        set {
            _rssi = newValue
        }
    }


    private final var _proximityUUID: UUID
    open override var proximityUUID: UUID {
        return _proximityUUID
    }

    private final var _major: Int = 0
    open override var major: NSNumber {
        return NSNumber(value: _major)
    }

    private final var _minor: Int = 0
    open override var minor: NSNumber {
        return NSNumber(value: _minor)
    }


    public init(
        proximityUUID: UUID,
        major: Int,
        minor: Int
        ) {

        _proximityUUID = proximityUUID
        _major = major
        _minor = minor

        super.init()
    }


    private enum MutableBeaconEncodingKeys {
        static let proximityUuid = "proximityUUID"
        static let major = "major"
        static let minor = "minor"
        static let proximity = "proximity"
        static let accuracy = "accuracy"
        static let rssi = "rssi"
    }

    public required init?(coder: NSCoder) {
        _proximityUUID = coder.decodeObject(forKey: MutableBeaconEncodingKeys.proximityUuid) as! UUID
        _major = coder.decodeInteger(forKey: MutableBeaconEncodingKeys.major)
        _minor = coder.decodeInteger(forKey: MutableBeaconEncodingKeys.minor)

        let rawProximity = coder.decodeInteger(forKey: MutableBeaconEncodingKeys.proximity)
        _proximity = CLProximity(rawValue: rawProximity)!
        _accuracy = coder.decodeDouble(forKey: MutableBeaconEncodingKeys.accuracy)
        _rssi = coder.decodeInteger(forKey: MutableBeaconEncodingKeys.rssi)

        super.init(coder: coder)
    }

    open override func encode(with coder: NSCoder) {
        coder.encode(proximityUUID, forKey: MutableBeaconEncodingKeys.proximityUuid)
        coder.encode(major.intValue, forKey: MutableBeaconEncodingKeys.major)
        coder.encode(minor.intValue, forKey: MutableBeaconEncodingKeys.minor)
        coder.encode(proximity.rawValue, forKey: MutableBeaconEncodingKeys.proximity)
        coder.encode(accuracy, forKey: MutableBeaconEncodingKeys.accuracy)
        coder.encode(rssi, forKey: MutableBeaconEncodingKeys.rssi)
    }

}
