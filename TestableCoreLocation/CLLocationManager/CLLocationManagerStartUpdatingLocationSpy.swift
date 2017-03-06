//
//  CLLocationManagerStartUpdatingLocationSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let startUpdatingLocationCalledKeyString = UUIDKeyString()
    private static let startUpdatingLocationCalledKey =
        ObjectAssociationKey(startUpdatingLocationCalledKeyString)
    private static let startUpdatingLocationCalledReference =
        SpyEvidenceReference(key: startUpdatingLocationCalledKey)


    /// Spy controller for ensuring that a location manager has had `startUpdatingLocation`
    /// called on it.
    public enum StartUpdatingLocationSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.startUpdatingLocation),
                spy: #selector(CLLocationManager.spy_startUpdatingLocation)
            )
        ] as Set
        public static let evidence = [startUpdatingLocationCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `startUpdatingLocation`
    dynamic public func spy_startUpdatingLocation() {
        startUpdatingLocationCalled = true
    }


    /// Indicates whether the `startUpdatingLocation` method has been called on this object.
    public final var startUpdatingLocationCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.startUpdatingLocationCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.startUpdatingLocationCalledReference)
        }
    }

}
