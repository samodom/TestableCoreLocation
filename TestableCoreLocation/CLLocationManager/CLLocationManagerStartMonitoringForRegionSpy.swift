//
//  CLLocationManagerStartMonitoringForRegionSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let startMonitoringForRegionCalledKeyString = UUIDKeyString()
    private static let startMonitoringForRegionCalledKey =
        ObjectAssociationKey(startMonitoringForRegionCalledKeyString)
    private static let startMonitoringForRegionCalledReference =
        SpyEvidenceReference(key: startMonitoringForRegionCalledKey)

    private static let startMonitoringForRegionRegionKeyString = UUIDKeyString()
    private static let startMonitoringForRegionRegionKey =
        ObjectAssociationKey(startMonitoringForRegionRegionKeyString)
    private static let startMonitoringForRegionRegionReference =
        SpyEvidenceReference(key: startMonitoringForRegionRegionKey)


    /// Spy controller for ensuring that a location manager has had `startMonitoring(for:)`
    /// called on it.
    public enum StartMonitoringForRegionSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.startMonitoring(for:)),
                spy: #selector(CLLocationManager.spy_startMonitoring(for:))
            )
        ] as Set
        public static let evidence = [
            startMonitoringForRegionCalledReference,
            startMonitoringForRegionRegionReference
        ] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `startMonitoring(for:)`
    dynamic public func spy_startMonitoring(for region: CLRegion) {
        startMonitoringForRegionCalled = true
        startMonitoringForRegionRegion = region
    }


    /// Indicates whether the `startMonitoring(for:)` method has been called on this object.
    public final var startMonitoringForRegionCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.startMonitoringForRegionCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.startMonitoringForRegionCalledReference)
        }
    }


    /// Provides the region passed to `startMonitoring(for:)` if called.
    public final var startMonitoringForRegionRegion: CLRegion? {
        get {
            return loadEvidence(with: CLLocationManager.startMonitoringForRegionRegionReference) as? CLRegion
        }
        set {
            let reference = CLLocationManager.startMonitoringForRegionRegionReference
            guard let region = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(region, with: reference)
        }
    }

}
