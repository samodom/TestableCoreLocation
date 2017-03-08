//
//  SampleValues.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation

let SampleCoordinate = CLLocationCoordinate2D(latitude: 12.3456, longitude: 65.4321)
let OtherCoordinate = CLLocationCoordinate2D(latitude: 65.4321, longitude: 12.3456)

let SampleLocation = CLLocation(
    latitude: SampleCoordinate.latitude,
    longitude: SampleCoordinate.longitude
)

let SampleRegion = CLCircularRegion(
    center: SampleCoordinate,
    radius: 14,
    identifier: "sample region"
)
