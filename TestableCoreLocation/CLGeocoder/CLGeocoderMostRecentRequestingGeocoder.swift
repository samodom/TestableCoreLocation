//
//  CLGeocoderMostRecentRequestingGeocoder.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 4/30/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger

extension CLGeocoder {

    private static let mostRecentRequestingGeocoderKeyString = UUIDKeyString()
    private static let mostRecentRequestingGeocoderKey =
        ObjectAssociationKey(mostRecentRequestingGeocoderKeyString)

    /// Property capturing the most recent geocoder to have been asked to perform any kind of 
    /// geocode request.
    public class var mostRecentRequestingGeocoder: CLGeocoder? {
        get {
            return association(for: mostRecentRequestingGeocoderKey) as? CLGeocoder
        }
        set {
            let key = mostRecentRequestingGeocoderKey
            guard let geocoder = newValue else {
                return removeAssociation(for: key)
            }

            associate(geocoder, with: key)
        }
    }

}
