//
//  CLLocationManagerRequestAlwaysAuthorizationSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let requestAlwaysAuthorizationCalledKeyString = UUIDKeyString()
    private static let requestAlwaysAuthorizationCalledKey =
        ObjectAssociationKey(requestAlwaysAuthorizationCalledKeyString)
    private static let requestAlwaysAuthorizationCalledReference =
        SpyEvidenceReference(key: requestAlwaysAuthorizationCalledKey)


    /// Spy controller for ensuring that a location manager has had `requestAlwaysAuthorization`
    /// called on it.
    public enum RequestAlwaysAuthorizationSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.requestAlwaysAuthorization),
                spy: #selector(CLLocationManager.spy_requestAlwaysAuthorization)
            )
        ] as Set
        public static let evidence = [requestAlwaysAuthorizationCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `requestAlwaysAuthorization`
    dynamic public func spy_requestAlwaysAuthorization() {
        requestAlwaysAuthorizationCalled = true
    }


    /// Indicates whether the `requestAlwaysAuthorization` method has been called on this object.
    public final var requestAlwaysAuthorizationCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.requestAlwaysAuthorizationCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.requestAlwaysAuthorizationCalledReference)
        }
    }

}
