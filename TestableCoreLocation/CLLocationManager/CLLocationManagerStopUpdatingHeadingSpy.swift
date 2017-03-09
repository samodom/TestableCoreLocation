//
//  CLLocationManagerStopUpdatingHeadingSpy.swift
//  TestableCoreHeading
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let stopUpdatingHeadingCalledKeyString = UUIDKeyString()
    private static let stopUpdatingHeadingCalledKey =
        ObjectAssociationKey(stopUpdatingHeadingCalledKeyString)
    private static let stopUpdatingHeadingCalledReference =
        SpyEvidenceReference(key: stopUpdatingHeadingCalledKey)


    /// Spy controller for ensuring that a location manager has had `stopUpdatingHeading`
    /// called on it.
    public enum StopUpdatingHeadingSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.stopUpdatingHeading),
                spy: #selector(CLLocationManager.spy_stopUpdatingHeading)
            )
        ] as Set
        public static let evidence = [stopUpdatingHeadingCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `stopUpdatingHeading`
    dynamic public func spy_stopUpdatingHeading() {
        stopUpdatingHeadingCalled = true
    }


    /// Indicates whether the `stopUpdatingHeading` method has been called on this object.
    public final var stopUpdatingHeadingCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.stopUpdatingHeadingCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.stopUpdatingHeadingCalledReference)
        }
    }

}
