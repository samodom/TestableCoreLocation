//
//  CLGeocoderReverseGeocodeLocationSpy.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/8/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public extension CLGeocoder {

    private static let reverseGeocodeLocationCalledKeyString = UUIDKeyString()
    private static let reverseGeocodeLocationCalledKey =
        ObjectAssociationKey(reverseGeocodeLocationCalledKeyString)
    private static let reverseGeocodeLocationCalledReference =
        SpyEvidenceReference(key: reverseGeocodeLocationCalledKey)

    private static let reverseGeocodeLocationLocationKeyString = UUIDKeyString()
    private static let reverseGeocodeLocationLocationKey =
        ObjectAssociationKey(reverseGeocodeLocationLocationKeyString)
    private static let reverseGeocodeLocationLocationReference =
        SpyEvidenceReference(key: reverseGeocodeLocationLocationKey)

    private static let reverseGeocodeLocationCompletionHandlerKeyString = UUIDKeyString()
    private static let reverseGeocodeLocationCompletionHandlerKey =
        ObjectAssociationKey(reverseGeocodeLocationCompletionHandlerKeyString)
    private static let reverseGeocodeLocationCompletionHandlerReference =
        SpyEvidenceReference(key: reverseGeocodeLocationCompletionHandlerKey)


    /// Spy controller for ensuring that a geocoder has had
    /// `reverseGeocodeLocation(_:completionHandler:)` called on it.
    public enum ReverseGeocodeLocationSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLGeocoder.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLGeocoder.reverseGeocodeLocation(_:completionHandler:)),
                spy: #selector(CLGeocoder.spy_reverseGeocodeLocation(_:completionHandler:))
            )
            ] as Set
        public static let evidence = [
            reverseGeocodeLocationCalledReference,
            reverseGeocodeLocationLocationReference,
            reverseGeocodeLocationCompletionHandlerReference
            ] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of
    /// `reverseGeocodeLocation(_:completionHandler:)`
    dynamic public func spy_reverseGeocodeLocation(
        _ location: CLLocation,
        completionHandler: @escaping CLGeocodeCompletionHandler
        ) {

        reverseGeocodeLocationCalled = true
        reverseGeocodeLocationLocation = location
        reverseGeocodeLocationCompletionHandler = completionHandler
    }


    /// Indicates whether the `reverseGeocodeLocation(_:completionHandler:)` method has been
    /// called on this object.
    public final var reverseGeocodeLocationCalled: Bool {
        get {
            return loadEvidence(with: CLGeocoder.reverseGeocodeLocationCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLGeocoder.reverseGeocodeLocationCalledReference)
        }
    }


    /// Provides the location passed to `reverseGeocodeLocation(_:completionHandler:)` if called.
    public final var reverseGeocodeLocationLocation: CLLocation? {
        get {
            return loadEvidence(with: CLGeocoder.reverseGeocodeLocationLocationReference) as? CLLocation
        }
        set {
            let reference = CLGeocoder.reverseGeocodeLocationLocationReference
            guard let location = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(location, with: reference)
        }
    }


    /// Provides the completion handler passed to `reverseGeocodeLocation(_:completionHandler:)`
    /// if called.
    public final var reverseGeocodeLocationCompletionHandler: CLGeocodeCompletionHandler? {
        get {
            return loadEvidence(with: CLGeocoder.reverseGeocodeLocationCompletionHandlerReference) as? CLGeocodeCompletionHandler
        }
        set {
            let reference = CLGeocoder.reverseGeocodeLocationCompletionHandlerReference
            guard let handler = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(handler, with: reference)
        }
    }

}
