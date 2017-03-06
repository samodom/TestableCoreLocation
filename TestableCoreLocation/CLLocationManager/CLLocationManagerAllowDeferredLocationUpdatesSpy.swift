//
//  CLLocationManagerAllowDeferredLocationUpdatesSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let allowDeferredLocationUpdatesCalledKeyString = UUIDKeyString()
    private static let allowDeferredLocationUpdatesCalledKey =
        ObjectAssociationKey(allowDeferredLocationUpdatesCalledKeyString)
    private static let allowDeferredLocationUpdatesCalledReference =
        SpyEvidenceReference(key: allowDeferredLocationUpdatesCalledKey)

    private static let allowDeferredLocationUpdatesDistanceKeyString = UUIDKeyString()
    private static let allowDeferredLocationUpdatesDistanceKey =
        ObjectAssociationKey(allowDeferredLocationUpdatesDistanceKeyString)
    private static let allowDeferredLocationUpdatesDistanceReference =
        SpyEvidenceReference(key: allowDeferredLocationUpdatesDistanceKey)

    private static let allowDeferredLocationUpdatesTimeoutKeyString = UUIDKeyString()
    private static let allowDeferredLocationUpdatesTimeoutKey =
        ObjectAssociationKey(allowDeferredLocationUpdatesTimeoutKeyString)
    private static let allowDeferredLocationUpdatesTimeoutReference =
        SpyEvidenceReference(key: allowDeferredLocationUpdatesTimeoutKey)


    /// Spy controller for ensuring that a location manager has had
    /// `allowDeferredLocationUpdates(untilTraveled:timeout:)` called on it.
    public enum AllowDeferredLocationUpdatesSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.allowDeferredLocationUpdates(untilTraveled:timeout:)),
                spy: #selector(CLLocationManager.spy_allowDeferredLocationUpdates(untilTraveled:timeout:))
            )
        ] as Set
        public static let evidence = [
            allowDeferredLocationUpdatesCalledReference,
            allowDeferredLocationUpdatesDistanceReference,
            allowDeferredLocationUpdatesTimeoutReference
        ] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of
    /// `allowDeferredLocationUpdates(untilTraveled:timeout:)`
    dynamic public func spy_allowDeferredLocationUpdates(
        untilTraveled distance: CLLocationDistance,
        timeout: TimeInterval
        ) {

        allowDeferredLocationUpdatesCalled = true
        allowDeferredLocationUpdatesDistance = distance
        allowDeferredLocationUpdatesTimeout = timeout
    }


    /// Indicates whether the `allowDeferredLocationUpdates(untilTraveled:timeout:)` method has
    /// been called on this object.
    public final var allowDeferredLocationUpdatesCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.allowDeferredLocationUpdatesCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.allowDeferredLocationUpdatesCalledReference)
        }
    }


    /// Provides the distance passed to `allowDeferredLocationUpdates(untilTraveled:timeout:)`
    /// if called.
    public final var allowDeferredLocationUpdatesDistance: CLLocationDistance? {
        get {
            return loadEvidence(with: CLLocationManager.allowDeferredLocationUpdatesDistanceReference) as? CLLocationDistance
        }
        set {
            let reference = CLLocationManager.allowDeferredLocationUpdatesDistanceReference
            guard let distance = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(distance, with: reference)
        }
    }


    /// Provides the timeout passed to `allowDeferredLocationUpdates(untilTraveled:timeout:)`
    /// if called.
    public final var allowDeferredLocationUpdatesTimeout: TimeInterval? {
        get {
            return loadEvidence(with: CLLocationManager.allowDeferredLocationUpdatesTimeoutReference) as? TimeInterval
        }
        set {
            let reference = CLLocationManager.allowDeferredLocationUpdatesTimeoutReference
            guard let timeout = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(timeout, with: reference)
        }
    }

}
