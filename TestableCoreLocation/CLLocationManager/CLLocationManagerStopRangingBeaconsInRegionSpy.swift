//
//  CLLocationManagerStopRangingBeaconsInRegionSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let stopRangingBeaconsInRegionCalledKeyString = UUIDKeyString()
    private static let stopRangingBeaconsInRegionCalledKey =
        ObjectAssociationKey(stopRangingBeaconsInRegionCalledKeyString)
    private static let stopRangingBeaconsInRegionCalledReference =
        SpyEvidenceReference(key: stopRangingBeaconsInRegionCalledKey)

    private static let stopRangingBeaconsInRegionRegionKeyString = UUIDKeyString()
    private static let stopRangingBeaconsInRegionRegionKey =
        ObjectAssociationKey(stopRangingBeaconsInRegionRegionKeyString)
    private static let stopRangingBeaconsInRegionRegionReference =
        SpyEvidenceReference(key: stopRangingBeaconsInRegionRegionKey)


    /// Spy controller for ensuring that a location manager has had `stopRangingBeacons(in:)`
    /// called on it.
    public enum StopRangingBeaconsInRegionSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.stopRangingBeacons(in:)),
                spy: #selector(CLLocationManager.spy_stopRangingBeacons(in:))
            )
        ] as Set
        public static let evidence = [
            stopRangingBeaconsInRegionCalledReference,
            stopRangingBeaconsInRegionRegionReference
        ] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `stopRangingBeacons(in:)`
    dynamic public func spy_stopRangingBeacons(in region: CLBeaconRegion) {
        stopRangingBeaconsInRegionCalled = true
        stopRangingBeaconsInRegionRegion = region
    }


    /// Indicates whether the `stopRangingBeacons(in:)` method has been called on this object.
    public final var stopRangingBeaconsInRegionCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.stopRangingBeaconsInRegionCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.stopRangingBeaconsInRegionCalledReference)
        }
    }


    /// Provides the region passed to `stopRangingBeacons(in:)` if called.
    public final var stopRangingBeaconsInRegionRegion: CLBeaconRegion? {
        get {
            return loadEvidence(with: CLLocationManager.stopRangingBeaconsInRegionRegionReference) as? CLBeaconRegion
        }
        set {
            let reference = CLLocationManager.stopRangingBeaconsInRegionRegionReference
            guard let region = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(region, with: reference)
        }
    }

}
