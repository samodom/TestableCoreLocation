//
//  TestGeocoder.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/8/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation

class TestGeocoder: CLGeocoder {

    var reverseGeocodeLocationTestMethodCalled = false
    dynamic override func reverseGeocodeLocation(
        _ location: CLLocation,
        completionHandler: @escaping CLGeocodeCompletionHandler
        ) {

        reverseGeocodeLocationTestMethodCalled = true
    }

    var geocodeAddressDictionaryTestMethodCalled = false
    dynamic override func geocodeAddressDictionary(
        _ addressDictionary: [AnyHashable : Any],
        completionHandler: @escaping CLGeocodeCompletionHandler
        ) {

        geocodeAddressDictionaryTestMethodCalled = true
    }

    var geocodeAddressStringTestMethodCalled = false
    dynamic override func geocodeAddressString(
        _ address: String,
        completionHandler: @escaping CLGeocodeCompletionHandler
        ) {

        geocodeAddressStringTestMethodCalled = true
    }

    var geocodeAddressStringInRegionTestMethodCalled = false
    dynamic override func geocodeAddressString(
        _ address: String,
        in region: CLRegion?,
        completionHandler: @escaping CLGeocodeCompletionHandler
        ) {

        geocodeAddressStringInRegionTestMethodCalled = true
    }

    var cancelGeocodeTestMethodCalled = false
    dynamic override func cancelGeocode() {
        cancelGeocodeTestMethodCalled = true
    }

}
