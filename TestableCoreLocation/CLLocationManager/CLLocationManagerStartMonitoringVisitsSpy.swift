//
//  CLLocationManagerStartMonitoringVisitsSpy.swift
//  TestableCoreHeading
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let startMonitoringVisitsCalledKeyString = UUIDKeyString()
    private static let startMonitoringVisitsCalledKey =
        ObjectAssociationKey(startMonitoringVisitsCalledKeyString)
    private static let startMonitoringVisitsCalledReference =
        SpyEvidenceReference(key: startMonitoringVisitsCalledKey)


    /// Spy controller for ensuring that a location manager has had `startMonitoringVisits`
    /// called on it.
    public enum StartMonitoringVisitsSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.startMonitoringVisits),
                spy: #selector(CLLocationManager.spy_startMonitoringVisits)
            )
        ] as Set
        public static let evidence = [startMonitoringVisitsCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `startMonitoringVisits`
    dynamic public func spy_startMonitoringVisits() {
        startMonitoringVisitsCalled = true
    }


    /// Indicates whether the `startMonitoringVisits` method has been called on this object.
    public final var startMonitoringVisitsCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.startMonitoringVisitsCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.startMonitoringVisitsCalledReference)
        }
    }

}
