//
//  CLLocationManagerStopMonitoringVisitsSpy.swift
//  TestableCoreHeading
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let stopMonitoringVisitsCalledKeyString = UUIDKeyString()
    private static let stopMonitoringVisitsCalledKey =
        ObjectAssociationKey(stopMonitoringVisitsCalledKeyString)
    private static let stopMonitoringVisitsCalledReference =
        SpyEvidenceReference(key: stopMonitoringVisitsCalledKey)


    /// Spy controller for ensuring that a location manager has had `stopMonitoringVisits`
    /// called on it.
    public enum StopMonitoringVisitsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.stopMonitoringVisits),
                spy: #selector(CLLocationManager.spy_stopMonitoringVisits)
            )
        ] as Set
        public static let evidence = [stopMonitoringVisitsCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `stopMonitoringVisits`
    dynamic public func spy_stopMonitoringVisits() {
        stopMonitoringVisitsCalled = true
    }


    /// Indicates whether the `stopMonitoringVisits` method has been called on this object.
    public final var stopMonitoringVisitsCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.stopMonitoringVisitsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.stopMonitoringVisitsCalledReference)
        }
    }

}
