//
//  CLLocationManagerRequestLocationSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


@available(iOS, introduced: 9.0)
public extension CLLocationManager {

    private static let requestLocationCalledKeyString = UUIDKeyString()
    private static let requestLocationCalledKey =
        ObjectAssociationKey(requestLocationCalledKeyString)
    private static let requestLocationCalledReference =
        SpyEvidenceReference(key: requestLocationCalledKey)


    /// Spy controller for ensuring that a location manager has had `requestLocation` called on it.
    @available(iOS, introduced: 9.0)
    public enum RequestLocationSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let evidence = [requestLocationCalledReference] as Set
        public static let forwardsInvocations = false

        @available(iOS, introduced: 9.0)
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.requestLocation),
                spy: #selector(CLLocationManager.spy_requestLocation)
            )
        ] as Set
    }


    /// Spy method that replaces the true implementation of `requestLocation`
    dynamic public func spy_requestLocation() {
        requestLocationCalled = true
    }


    /// Indicates whether the `requestLocation` method has been called on this object.
    public final var requestLocationCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.requestLocationCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.requestLocationCalledReference)
        }
    }

}
