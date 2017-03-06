//
//  CLLocationManagerStartMonitoringSignificantLocationChangesSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let startMonitoringSignificantLocationChangesCalledKeyString = UUIDKeyString()
    private static let startMonitoringSignificantLocationChangesCalledKey =
        ObjectAssociationKey(startMonitoringSignificantLocationChangesCalledKeyString)
    private static let startMonitoringSignificantLocationChangesCalledReference =
        SpyEvidenceReference(key: startMonitoringSignificantLocationChangesCalledKey)


    /// Spy controller for ensuring that a location manager has had `startMonitoringSignificantLocationChanges`
    /// called on it.
    public enum StartMonitoringSignificantLocationChangesSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.startMonitoringSignificantLocationChanges),
                spy: #selector(CLLocationManager.spy_startMonitoringSignificantLocationChanges)
            )
        ] as Set
        public static let evidence = [startMonitoringSignificantLocationChangesCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `startMonitoringSignificantLocationChanges`
    dynamic public func spy_startMonitoringSignificantLocationChanges() {
        startMonitoringSignificantLocationChangesCalled = true
    }


    /// Indicates whether the `startMonitoringSignificantLocationChanges` method has been called on this object.
    public final var startMonitoringSignificantLocationChangesCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.startMonitoringSignificantLocationChangesCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.startMonitoringSignificantLocationChangesCalledReference)
        }
    }

}
