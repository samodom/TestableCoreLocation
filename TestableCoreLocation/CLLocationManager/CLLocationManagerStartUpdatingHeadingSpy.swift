//
//  CLLocationManagerStartUpdatingHeadingSpy.swift
//  TestableCoreHeading
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLLocationManager {

    private static let startUpdatingHeadingCalledKeyString = UUIDKeyString()
    private static let startUpdatingHeadingCalledKey =
        ObjectAssociationKey(startUpdatingHeadingCalledKeyString)
    private static let startUpdatingHeadingCalledReference =
        SpyEvidenceReference(key: startUpdatingHeadingCalledKey)


    /// Spy controller for ensuring that a location manager has had `startUpdatingHeading`
    /// called on it.
    public enum StartUpdatingHeadingSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLLocationManager.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLLocationManager.startUpdatingHeading),
                spy: #selector(CLLocationManager.spy_startUpdatingHeading)
            )
        ] as Set
        public static let evidence = [startUpdatingHeadingCalledReference] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of `startUpdatingHeading`
    dynamic public func spy_startUpdatingHeading() {
        startUpdatingHeadingCalled = true
    }


    /// Indicates whether the `startUpdatingHeading` method has been called on this object.
    public final var startUpdatingHeadingCalled: Bool {
        get {
            return loadEvidence(with: CLLocationManager.startUpdatingHeadingCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLLocationManager.startUpdatingHeadingCalledReference)
        }
    }

}
