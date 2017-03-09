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
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}
