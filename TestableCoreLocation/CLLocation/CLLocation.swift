//
//  CLLocation.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation

public class CLLocation: CoreLocation.CLLocation {

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
        Mutable override of the `coordinate` property.
    */
    public override var altitude: CLLocationDistance {
        get {
            if altitudeOverride != nil {
                return altitudeOverride!
            }
            else {
                return super.altitude
            }
        }
        set {
            altitudeOverride = newValue
        }
    }

    /*!
        Mutable override of the `floor` property.
    */
    public override var floor: CoreLocation.CLFloor? {
        get {
            if floorOverride != nil {
                return floorOverride!
            }
            else {
                return super.floor
            }
        }
        set {
            floorOverride = newValue
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
        Mutable override of the `verticalAccuracy` property.
    */
    public override var verticalAccuracy: CLLocationAccuracy {
        get {
            if verticalAccuracyOverride != nil {
                return verticalAccuracyOverride!
            }
            else {
                return super.verticalAccuracy
            }
        }
        set {
            verticalAccuracyOverride = newValue
        }
    }

    /*!
        Mutable override of the `timestamp` property.
    */
    public override var timestamp: NSDate {
        get {
            if timestampOverride != nil {
                return timestampOverride!
            }
            else {
                return super.timestamp
            }
        }
        set {
            timestampOverride = newValue
        }
    }

    /*!
        Mutable override of the `description` property.
    */
    public override var description: String {
        get {
            if descriptionOverride != nil {
                return descriptionOverride!
            }
            else {
                return super.description
            }
        }
        set {
            descriptionOverride = newValue
        }
    }

    /*!
        Mutable override of the `speed` property.
    */
    public override var speed: CLLocationSpeed {
        get {
            if speedOverride != nil {
                return speedOverride!
            }
            else {
                return super.speed
            }
        }
        set {
            speedOverride = newValue
        }
    }

    /*!
        Mutable override of the `course` property.
    */
    public override var course: CLLocationDirection {
        get {
            if courseOverride != nil {
                return courseOverride!
            }
            else {
                return super.course
            }
        }
        set {
            courseOverride = newValue
        }
    }


    private var coordinateOverride: CLLocationCoordinate2D?
    private var altitudeOverride: CLLocationDistance?
    private var floorOverride: CoreLocation.CLFloor?
    private var horizontalAccuracyOverride: CLLocationAccuracy?
    private var verticalAccuracyOverride: CLLocationAccuracy?
    private var timestampOverride: NSDate?
    private var descriptionOverride: String?
    private var speedOverride: CLLocationSpeed?
    private var courseOverride: CLLocationDirection?

}
