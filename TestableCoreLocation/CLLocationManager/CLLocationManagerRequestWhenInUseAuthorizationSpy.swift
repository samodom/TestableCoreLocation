//
//  CLLocationManagerRequestWhenInUseAuthorizationSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let requestWhenInUseAuthorizationCalledKeyString = UUIDKeyString()
    private static let requestWhenInUseAuthorizationCalledKey =
        ObjectAssociationKey(requestWhenInUseAuthorizationCalledKeyString)
    private static let requestWhenInUseAuthorizationCalledReference =
        SpyEvidenceReference(key: requestWhenInUseAuthorizationCalledKey)


    /// Spy controller for ensuring that a location manager has had  `requestWhenInUseAuthorization`
    /// called on it.
    public enum RequestWhenInUseAuthorizationSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.requestWhenInUseAuthorization),
                spy: #selector(CLLocationManager.spy_requestWhenInUseAuthorization)
            )
        ] as Set
        public static let evidence = [requestWhenInUseAuthorizationCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `requestWhenInUseAuthorization`
    dynamic public func spy_requestWhenInUseAuthorization() {
        requestWhenInUseAuthorizationCalled = true
    }


    /// Indicates whether the `requestWhenInUseAuthorization` method has been called on this object.
    public final var requestWhenInUseAuthorizationCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.requestWhenInUseAuthorizationCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.requestWhenInUseAuthorizationCalledReference)
        }
    }

}
