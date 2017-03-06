//
//  CLLocationManagerStopMonitoringForRegionSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let stopMonitoringForRegionCalledKeyString = UUIDKeyString()
    private static let stopMonitoringForRegionCalledKey =
        ObjectAssociationKey(stopMonitoringForRegionCalledKeyString)
    private static let stopMonitoringForRegionCalledReference =
        SpyEvidenceReference(key: stopMonitoringForRegionCalledKey)

    private static let stopMonitoringForRegionRegionKeyString = UUIDKeyString()
    private static let stopMonitoringForRegionRegionKey =
        ObjectAssociationKey(stopMonitoringForRegionRegionKeyString)
    private static let stopMonitoringForRegionRegionReference =
        SpyEvidenceReference(key: stopMonitoringForRegionRegionKey)


    /// Spy controller for ensuring that a location manager has had `stopMonitoring(for:)`
    /// called on it.
    public enum StopMonitoringForRegionSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.stopMonitoring(for:)),
                spy: #selector(CLLocationManager.spy_stopMonitoring(for:))
            )
        ] as Set
        public static let evidence = [
            stopMonitoringForRegionCalledReference,
            stopMonitoringForRegionRegionReference
        ] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `stopMonitoring(for:)`
    dynamic public func spy_stopMonitoring(for region: CLRegion) {
        stopMonitoringForRegionCalled = true
        stopMonitoringForRegionRegion = region
    }


    /// Indicates whether the `stopMonitoring(for:)` method has been called on this object.
    public final var stopMonitoringForRegionCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.stopMonitoringForRegionCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.stopMonitoringForRegionCalledReference)
        }
    }


    /// Provides the region passed to `stopMonitoring(for:)` if called.
    public final var stopMonitoringForRegionRegion: CLRegion? {
        get {
            return loadEvidence(with: CLLocationManager.stopMonitoringForRegionRegionReference) as? CLRegion
        }
        set {
            let reference = CLLocationManager.stopMonitoringForRegionRegionReference
            guard let region = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(region, with: reference)
        }
    }

}
