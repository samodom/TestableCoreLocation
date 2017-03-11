//
//  CLLocationCoordinate2D.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/8/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D: Equatable {}

public func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {

    func longitudesEqual(_ longitude1: CLLocationDegrees, _ longitude2: CLLocationDegrees) -> Bool {
        if longitude1.isAntimeridian && longitude2.isAntimeridian {
            return true
        }
        else {
            return longitude1 == longitude2
        }
    }

    guard CLLocationCoordinate2DIsValid(lhs),
        CLLocationCoordinate2DIsValid(rhs) else {
            return false
    }

    let latitudesEqual = lhs.latitude == rhs.latitude
    return latitudesEqual && longitudesEqual(lhs.longitude, rhs.longitude)
}


private extension CLLocationDegrees {

    var isAntimeridian: Bool {
        return abs(self) == 180
    }

}
