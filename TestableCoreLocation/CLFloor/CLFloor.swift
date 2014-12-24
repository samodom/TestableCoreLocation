//
//  CLFloor.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation

public class CLFloor: CoreLocation.CLFloor {

    /*!
        Exposed initializer.
    */
    public init(level: Int) {
        super.init()
        levelOverride = level
    }

    /*!
        Mutable override of the `level` property.
    */
    public override var level: Int {
        get {
            if levelOverride != nil {
                return levelOverride!
            }
            else {
                return super.level
            }
        }
        set {
            levelOverride = newValue
        }
    }

    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    private var levelOverride: Int?

}
