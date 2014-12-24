//
//  CLVisit.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation

public class CLVisit: CoreLocation.CLVisit {

    /*!
        Exposed initializer.
    */
    public init(coordinate: CLLocationCoordinate2D, horizontalAccuracy: CLLocationAccuracy, arrivalDate: NSDate, departureDate: NSDate) {
        super.init()
        coordinateOverride = coordinate
        horizontalAccuracyOverride = horizontalAccuracy
        arrivalDateOverride = arrivalDate
        departureDateOverride = departureDate
    }

    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    /*!
        Mutable override of the `coordinate` property.
    */
    public override var coordinate: CLLocationCoordinate2D {
        get {
            if coordinateOverride != nil {
                return coordinateOverride!
            }
            else {
                return super.coordinate
            }
        }
        set {
            coordinateOverride = newValue
        }
    }

    /*!
        Mutable override of the `horizontalAccuracy` property.
    */
    public override var horizontalAccuracy: CLLocationAccuracy {
        get {
            if horizontalAccuracyOverride != nil {
                return horizontalAccuracyOverride!
            }
            else {
                return super.horizontalAccuracy
            }
        }
        set {
            horizontalAccuracyOverride = newValue
        }
    }

    /*!
        Mutable override of the `arrivalDate` property.
    */
    public override var arrivalDate: NSDate {
        get {
            if arrivalDateOverride != nil {
                return arrivalDateOverride!
            }
            else {
                return super.arrivalDate
            }
        }
        set {
            arrivalDateOverride = newValue
        }
    }

    /*!
        Mutable override of the `departureDate` property.
    */
    public override var departureDate: NSDate {
        get {
            if departureDateOverride != nil {
                return departureDateOverride!
            }
            else {
                return super.departureDate
            }
        }
        set {
            departureDateOverride = newValue
        }
    }

    private var coordinateOverride: CLLocationCoordinate2D?
    private var horizontalAccuracyOverride: CLLocationAccuracy?
    private var arrivalDateOverride: NSDate?
    private var departureDateOverride: NSDate?

}
