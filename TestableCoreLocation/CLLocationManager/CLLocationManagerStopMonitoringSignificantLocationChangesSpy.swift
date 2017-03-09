//
//  CLLocationManagerStopMonitoringSignificantLocationChangesSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let stopMonitoringSignificantLocationChangesCalledKeyString = UUIDKeyString()
    private static let stopMonitoringSignificantLocationChangesCalledKey =
        ObjectAssociationKey(stopMonitoringSignificantLocationChangesCalledKeyString)
    private static let stopMonitoringSignificantLocationChangesCalledReference =
        SpyEvidenceReference(key: stopMonitoringSignificantLocationChangesCalledKey)


    /// Spy controller for ensuring that a location manager has had `stopMonitoringSignificantLocationChanges`
    /// called on it.
    public enum StopMonitoringSignificantLocationChangesSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.stopMonitoringSignificantLocationChanges),
                spy: #selector(CLLocationManager.spy_stopMonitoringSignificantLocationChanges)
            )
        ] as Set
        public static let evidence = [stopMonitoringSignificantLocationChangesCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `stopMonitoringSignificantLocationChanges`
    dynamic public func spy_stopMonitoringSignificantLocationChanges() {
        stopMonitoringSignificantLocationChangesCalled = true
    }


    /// Indicates whether the `stopMonitoringSignificantLocationChanges` method has been called on this object.
    public final var stopMonitoringSignificantLocationChangesCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.stopMonitoringSignificantLocationChangesCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.stopMonitoringSignificantLocationChangesCalledReference)
        }
    }

}
