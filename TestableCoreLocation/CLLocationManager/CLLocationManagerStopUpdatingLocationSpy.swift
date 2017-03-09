//
//  CLLocationManagerStopUpdatingLocationSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let stopUpdatingLocationCalledKeyString = UUIDKeyString()
    private static let stopUpdatingLocationCalledKey =
        ObjectAssociationKey(stopUpdatingLocationCalledKeyString)
    private static let stopUpdatingLocationCalledReference =
        SpyEvidenceReference(key: stopUpdatingLocationCalledKey)


    /// Spy controller for ensuring that a location manager has had `stopUpdatingLocation`
    /// called on it.
    public enum StopUpdatingLocationSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.stopUpdatingLocation),
                spy: #selector(CLLocationManager.spy_stopUpdatingLocation)
            )
        ] as Set
        public static let evidence = [stopUpdatingLocationCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `stopUpdatingLocation`
    dynamic public func spy_stopUpdatingLocation() {
        stopUpdatingLocationCalled = true
    }


    /// Indicates whether the `stopUpdatingLocation` method has been called on this object.
    public final var stopUpdatingLocationCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.stopUpdatingLocationCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.stopUpdatingLocationCalledReference)
        }
    }

}
