//
//  CLLocationManagerDisallowDeferredLocationUpdatesSpy.swift
//  TestableCoreHeading
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let disallowDeferredLocationUpdatesCalledKeyString = UUIDKeyString()
    private static let disallowDeferredLocationUpdatesCalledKey =
        ObjectAssociationKey(disallowDeferredLocationUpdatesCalledKeyString)
    private static let disallowDeferredLocationUpdatesCalledReference =
        SpyEvidenceReference(key: disallowDeferredLocationUpdatesCalledKey)


    /// Spy controller for ensuring that a location manager has had 
    ///`disallowDeferredLocationUpdates` called on it.
    public enum DisallowDeferredLocationUpdatesSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.disallowDeferredLocationUpdates),
                spy: #selector(CLLocationManager.spy_disallowDeferredLocationUpdates)
            )
        ] as Set
        public static let evidence = [disallowDeferredLocationUpdatesCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `disallowDeferredLocationUpdates`
    dynamic public func spy_disallowDeferredLocationUpdates() {
        disallowDeferredLocationUpdatesCalled = true
    }


    /// Indicates whether the `disallowDeferredLocationUpdates` method has been called on this object.
    public final var disallowDeferredLocationUpdatesCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.disallowDeferredLocationUpdatesCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.disallowDeferredLocationUpdatesCalledReference)
        }
    }

}
