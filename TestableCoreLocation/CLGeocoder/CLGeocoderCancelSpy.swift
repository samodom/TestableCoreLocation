//
//  CLGeocoderCancelSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/8/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLGeocoder {

    private static let cancelGeocodeCalledKeyString = UUIDKeyString()
    private static let cancelGeocodeCalledKey =
        ObjectAssociationKey(cancelGeocodeCalledKeyString)
    private static let cancelGeocodeCalledReference =
        SpyEvidenceReference(key: cancelGeocodeCalledKey)


    /// Spy controller for ensuring that a geocoder has had `cancelGeocode` called on it.
    public enum CancelGeocodeSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLGeocoder.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLGeocoder.cancelGeocode),
                spy: #selector(CLGeocoder.spy_cancelGeocode)
            )
        ] as Set
        public static let evidence = [cancelGeocodeCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `cancelGeocode`
    dynamic public func spy_cancelGeocode() {
        cancelGeocodeCalled = true
    }


    /// Indicates whether the `cancelGeocode` method has been called on this object.
    public final var cancelGeocodeCalled: Bool {
        get {
            return loadEvidence(with: CLGeocoder.cancelGeocodeCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLGeocoder.cancelGeocodeCalledReference)
        }
    }

}
