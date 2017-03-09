//
//  CLLocationManagerStartRangingBeaconsInRegionSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let startRangingBeaconsInRegionCalledKeyString = UUIDKeyString()
    private static let startRangingBeaconsInRegionCalledKey =
        ObjectAssociationKey(startRangingBeaconsInRegionCalledKeyString)
    private static let startRangingBeaconsInRegionCalledReference =
        SpyEvidenceReference(key: startRangingBeaconsInRegionCalledKey)

    private static let startRangingBeaconsInRegionRegionKeyString = UUIDKeyString()
    private static let startRangingBeaconsInRegionRegionKey =
        ObjectAssociationKey(startRangingBeaconsInRegionRegionKeyString)
    private static let startRangingBeaconsInRegionRegionReference =
        SpyEvidenceReference(key: startRangingBeaconsInRegionRegionKey)


    /// Spy controller for ensuring that a location manager has had `startRangingBeacons(in:)`
    /// called on it.
    public enum StartRangingBeaconsInRegionSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.startRangingBeacons(in:)),
                spy: #selector(CLLocationManager.spy_startRangingBeacons(in:))
            )
        ] as Set
        public static let evidence = [
            startRangingBeaconsInRegionCalledReference,
            startRangingBeaconsInRegionRegionReference
        ] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `startRangingBeacons(in:)`
    dynamic public func spy_startRangingBeacons(in region: CLBeaconRegion) {
        startRangingBeaconsInRegionCalled = true
        startRangingBeaconsInRegionRegion = region
    }


    /// Indicates whether the `startRangingBeacons(in:)` method has been called on this object.
    public final var startRangingBeaconsInRegionCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.startRangingBeaconsInRegionCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.startRangingBeaconsInRegionCalledReference)
        }
    }


    /// Provides the region passed to `startRangingBeacons(in:)` if called.
    public final var startRangingBeaconsInRegionRegion: CLBeaconRegion? {
        get {
            return loadEvidence(with: CLLocationManager.startRangingBeaconsInRegionRegionReference) as? CLBeaconRegion
        }
        set {
            let reference = CLLocationManager.startRangingBeaconsInRegionRegionReference
            guard let region = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(region, with: reference)
        }
    }

}
