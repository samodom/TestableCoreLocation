//
//  MutableVisit.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation

open class MutableVisit: CLVisit {

    /// Mutable coordinate of a visit.
    private var _coordinate: CLLocationCoordinate2D
    open override var coordinate: CLLocationCoordinate2D {
        get {
            return _coordinate
        }
        set {
            _coordinate = newValue
        }
    }


    /// Mutable horizontal accuracy of a visit.
    private var _horizontalAccuracy: CLLocationDistance
    open override var horizontalAccuracy: CLLocationAccuracy {
        get {
            return _horizontalAccuracy
        }
        set {
            _horizontalAccuracy = newValue
        }
    }


    /// Mutable arrival date of a visit.
    private var _arrivalDate = Date()
    open override var arrivalDate: Date {
        get {
            return _arrivalDate
        }
        set {
            guard newValue.compare(departureDate) != .orderedDescending else { return }
            _arrivalDate = newValue
        }
    }


    /// Mutable departure date of a visit.
    private var _departureDate = Date()
    open override var departureDate: Date {
        get {
            return _departureDate
        }
        set {
            guard newValue.compare(arrivalDate) != .orderedAscending else { return }
            _departureDate = newValue
        }
    }

    public init(
        coordinate: CLLocationCoordinate2D,
        horizontalAccuracy: CLLocationDistance,
        arrivalDate: Date,
        departureDate: Date
        ) {

        _coordinate = coordinate
        _horizontalAccuracy = horizontalAccuracy
        _arrivalDate = arrivalDate
        _departureDate = departureDate
        super.init()
    }

    private enum MutableVisitEncodingKey {
        static let latitude = "latitude"
        static let longitude = "longitude"
        static let horizontalAccuracy = "horizontalAccuracy"
        static let arrivalDate = "arrivalDate"
        static let departureDate = "departureDate"
    }

    public required init?(coder: NSCoder) {
        let latitude = coder.decodeDouble(forKey: MutableVisitEncodingKey.latitude)
        let longitude = coder.decodeDouble(forKey: MutableVisitEncodingKey.longitude)
        _coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

        _horizontalAccuracy = coder.decodeDouble(forKey: MutableVisitEncodingKey.horizontalAccuracy)

        if let arrival = coder.decodeObject(forKey: MutableVisitEncodingKey.arrivalDate) as? Date {
            _arrivalDate = arrival
        }

        if let departure = coder.decodeObject(forKey: MutableVisitEncodingKey.departureDate) as? Date {
            _departureDate = departure
        }

        super.init(coder: coder)
    }

    open override func encode(with coder: NSCoder) {
        coder.encode(coordinate.latitude, forKey: MutableVisitEncodingKey.latitude)
        coder.encode(coordinate.longitude, forKey: MutableVisitEncodingKey.longitude)
        coder.encode(horizontalAccuracy, forKey: MutableVisitEncodingKey.horizontalAccuracy)
        coder.encode(arrivalDate, forKey: MutableVisitEncodingKey.arrivalDate)
        coder.encode(departureDate, forKey: MutableVisitEncodingKey.departureDate)
    }

}
