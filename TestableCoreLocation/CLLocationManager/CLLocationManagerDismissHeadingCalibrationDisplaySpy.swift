//
//  CLLocationManagerDismissHeadingCalibrationDisplaySpy.swift
//  TestableCoreHeading
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let dismissHeadingCalibrationDisplayCalledKeyString = UUIDKeyString()
    private static let dismissHeadingCalibrationDisplayCalledKey =
        ObjectAssociationKey(dismissHeadingCalibrationDisplayCalledKeyString)
    private static let dismissHeadingCalibrationDisplayCalledReference =
        SpyEvidenceReference(key: dismissHeadingCalibrationDisplayCalledKey)


    /// Spy controller for ensuring that a location manager has had `dismissHeadingCalibrationDisplay`
    /// called on it.
    public enum DismissHeadingCalibrationDisplaySpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.dismissHeadingCalibrationDisplay),
                spy: #selector(CLLocationManager.spy_dismissHeadingCalibrationDisplay)
            )
        ] as Set
        public static let evidence = [dismissHeadingCalibrationDisplayCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `dismissHeadingCalibrationDisplay`
    dynamic public func spy_dismissHeadingCalibrationDisplay() {
        dismissHeadingCalibrationDisplayCalled = true
    }


    /// Indicates whether the `dismissHeadingCalibrationDisplay` method has been called on this object.
    public final var dismissHeadingCalibrationDisplayCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.dismissHeadingCalibrationDisplayCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.dismissHeadingCalibrationDisplayCalledReference)
        }
    }

}
