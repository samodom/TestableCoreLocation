//
//  CLLocationCoordinate2DEquatability.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/24/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D: Equatable {

}

public func ==(coordinate1: CLLocationCoordinate2D, coordinate2: CLLocationCoordinate2D) -> Bool {
    return coordinate1.latitude == coordinate2.latitude && coordinate1.longitude == coordinate2.longitude
}
