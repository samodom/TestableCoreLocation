//
//  CoordinateEqualityTestingHelpers.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/10/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation

enum DegreeSize {
    case tiny, small, medium, large

    static let allSizes = [DegreeSize.tiny, .small, .medium, .large]

    private static let tinyDegree: CLLocationDegrees = 0
    private static let smallDegree: CLLocationDegrees = 1

    var latitude: CLLocationDegrees {
        switch self {
        case .tiny:
            return DegreeSize.tinyDegree

        case .small:
            return DegreeSize.smallDegree

        case .medium:
            return 45

        case .large:
            return 88
        }

    }

    var longitude: CLLocationDegrees {
        switch self {
        case .tiny:
            return DegreeSize.tinyDegree

        case .small:
            return DegreeSize.smallDegree

        case .medium:
            return 90

        case .large:
            return 175
        }
    }

    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }


    private static func rangeOfDegreesAround(
        _ degree: CLLocationDegrees,
        for multipliers: [Int]
        ) -> [CLLocationDegrees] {

        return multipliers.map { degree + CLLocationDegrees($0) * degree.ulp }
    }

    func coordinatesAroundDegreeSize(equivalent: Bool) -> [CLLocationCoordinate2D] {
        let deltaMultipliers = equivalent ? [0] : [-1, 1]
        return
            DegreeSize.rangeOfDegreesAround(longitude, for: deltaMultipliers).map {
                CLLocationCoordinate2D(latitude: latitude, longitude: $0)
            }
            +
            DegreeSize.rangeOfDegreesAround(latitude, for: deltaMultipliers).map {
                CLLocationCoordinate2D(
                    latitude: $0,
                    longitude: longitude
                )
            }
    }

}
