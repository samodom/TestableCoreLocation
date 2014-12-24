//
//  CLHeading.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation

public class CLHeading: CoreLocation.CLHeading {

    /*!
        Exposed initializer.
    */
    public init(magneticHeading: CLLocationDirection, trueHeading: CLLocationDirection, headingAccuracy: CLLocationDirection, timestamp: NSDate, description: String?, rawComponents: CLHeadingComponentValues3D) {
        super.init()
        magneticHeadingOverride = magneticHeading
        trueHeadingOverride = trueHeading
        headingAccuracyOverride = headingAccuracy
        timestampOverride = timestamp
        descriptionOverride = description
        xOverride = rawComponents.x
        yOverride = rawComponents.y
        zOverride = rawComponents.z
    }

    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }


    /*!
        Mutable override of the `magneticHeading` property.
    */
    public override var magneticHeading: CLLocationDirection {
        get {
            if magneticHeadingOverride != nil {
                return magneticHeadingOverride!
            }
            else {
                return super.magneticHeading
            }
        }
        set {
            magneticHeadingOverride = newValue
        }
    }

    /*!
        Mutable override of the `trueHeading` property.
    */
    public override var trueHeading: CLLocationDirection {
        get {
            if trueHeadingOverride != nil {
                return trueHeadingOverride!
            }
            else {
                return super.trueHeading
            }
        }
        set {
            trueHeadingOverride = newValue
        }
    }

    /*!
        Mutable override of the `headingAccuracy` property.
    */
    public override var headingAccuracy: CLLocationDirection {
        get {
            if headingAccuracyOverride != nil {
                return headingAccuracyOverride!
            }
            else {
                return super.headingAccuracy
            }
        }
        set {
            headingAccuracyOverride = newValue
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
    public override var description: String! {
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
        Mutable override of the `x` property.
    */
    public override var x: CLHeadingComponentValue {
        get {
            if xOverride != nil {
                return xOverride!
            }
            else {
                return super.x
            }
        }
        set {
            xOverride = newValue
        }
    }

    /*!
        Mutable override of the `y` property.
    */
    public override var y: CLHeadingComponentValue {
        get {
            if yOverride != nil {
                return yOverride!
            }
            else {
                return super.y
            }
        }
        set {
            yOverride = newValue
        }
    }

    /*!
        Mutable override of the `z` property.
    */
    public override var z: CLHeadingComponentValue {
        get {
            if zOverride != nil {
                return zOverride!
            }
            else {
                return super.z
            }
        }
        set {
            zOverride = newValue
        }
    }

    private var magneticHeadingOverride: CLLocationDirection?
    private var trueHeadingOverride: CLLocationDirection?
    private var headingAccuracyOverride: CLLocationAccuracy?
    private var timestampOverride: NSDate?
    private var descriptionOverride: String?
    private var xOverride: CLHeadingComponentValue?
    private var yOverride: CLHeadingComponentValue?
    private var zOverride: CLHeadingComponentValue?

}
