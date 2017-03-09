//
//  CLGeocoderGeocodeAddressSpy.swift
//  TestableCoreDictionary
//
//  Created by Sam Odom on 3/8/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation
import FoundationSwagger
import TestSwagger


public typealias CLGeocoderAddressDictionary = [AnyHashable: Any]


public extension CLGeocoder {

    private static let geocodeAddressCalledKeyString = UUIDKeyString()
    private static let geocodeAddressCalledKey =
        ObjectAssociationKey(geocodeAddressCalledKeyString)
    private static let geocodeAddressCalledReference =
        SpyEvidenceReference(key: geocodeAddressCalledKey)

    private static let geocodeAddressDictionaryKeyString = UUIDKeyString()
    private static let geocodeAddressDictionaryKey =
        ObjectAssociationKey(geocodeAddressDictionaryKeyString)
    private static let geocodeAddressDictionaryReference =
        SpyEvidenceReference(key: geocodeAddressDictionaryKey)

    private static let geocodeAddressStringKeyString = UUIDKeyString()
    private static let geocodeAddressStringKey =
        ObjectAssociationKey(geocodeAddressStringKeyString)
    private static let geocodeAddressStringReference =
        SpyEvidenceReference(key: geocodeAddressStringKey)

    private static let geocodeAddressRegionKeyString = UUIDKeyString()
    private static let geocodeAddressRegionKey =
        ObjectAssociationKey(geocodeAddressRegionKeyString)
    private static let geocodeAddressRegionReference =
        SpyEvidenceReference(key: geocodeAddressRegionKey)

    private static let geocodeAddressCompletionHandlerKeyString = UUIDKeyString()
    private static let geocodeAddressCompletionHandlerKey =
        ObjectAssociationKey(geocodeAddressCompletionHandlerKeyString)
    private static let geocodeAddressCompletionHandlerReference =
        SpyEvidenceReference(key: geocodeAddressCompletionHandlerKey)


    /// Spy controller for ensuring that a geocoder has had
    /// `geocodeAddressDictionary(_:completionHandler:)`,
    /// `geocodeAddressString(_:completionHandler:)` or
    /// `geocodeAddressString(_:in:completionHandler:)` called on it.
    public enum ForwardGeocodeAddressSpyController: SpyController {
        public static let rootSpyableClass: AnyClass = CLGeocoder.self
        public static let vector = SpyVector.direct
        public static let coselectors = [
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLGeocoder.geocodeAddressDictionary(_:completionHandler:)),
                spy: #selector(CLGeocoder.spy_geocodeAddressDictionary(_:completionHandler:))
            ),
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLGeocoder.geocodeAddressString(_:completionHandler:)),
                spy: #selector(CLGeocoder.spy_geocodeAddressString(_:completionHandler:))
            ),
            SpyCoselectors(
                methodType: .instance,
                original: #selector(CLGeocoder.geocodeAddressString(_:in:completionHandler:)),
                spy: #selector(CLGeocoder.spy_geocodeAddressString(_:in:completionHandler:))
            )
        ] as Set
        public static let evidence = [
            geocodeAddressCalledReference,
            geocodeAddressDictionaryReference,
            geocodeAddressStringReference,
            geocodeAddressRegionReference,
            geocodeAddressCompletionHandlerReference
        ] as Set
        public static let forwardsInvocations = false
    }


    /// Spy method that replaces the true implementation of
    /// `geocodeAddressDictionary(_:completionHandler:)`
    dynamic public func spy_geocodeAddressDictionary(
        _ dictionary: CLGeocoderAddressDictionary,
        completionHandler: @escaping CLGeocodeCompletionHandler
        ) {

        forwardGeocodeAddressCalled = true
        forwardGeocodeAddressDictionary = dictionary
        forwardGeocodeAddressCompletionHandler = completionHandler
    }


    /// Spy method that replaces the true implementation of
    /// `geocodeAddressString(_:completionHandler:)`
    dynamic public func spy_geocodeAddressString(
        _ address: String,
        completionHandler: @escaping CLGeocodeCompletionHandler
        ) {

        forwardGeocodeAddressCalled = true
        forwardGeocodeAddressString = address
        forwardGeocodeAddressCompletionHandler = completionHandler
    }


    /// Spy method that replaces the true implementation of
    /// `geocodeAddressString(_:in:completionHandler:)`
    dynamic public func spy_geocodeAddressString(
        _ address: String,
        in region: CLRegion,
        completionHandler: @escaping CLGeocodeCompletionHandler
        ) {

        forwardGeocodeAddressCalled = true
        forwardGeocodeAddressString = address
        forwardGeocodeAddressRegion = region
        forwardGeocodeAddressCompletionHandler = completionHandler
    }


    /// Indicates whether the `geocodeAddressDictionary(_:completionHandler:)`,
    /// `geocodeAddressString(_:completionHandler:)` or
    /// `geocodeAddressString(_:in:completionHandler:)` method has been called on this object.
    public final var forwardGeocodeAddressCalled: Bool {
        get {
            return loadEvidence(with: CLGeocoder.geocodeAddressCalledReference) as? Bool ?? false
        }
        set {
            saveEvidence(newValue, with: CLGeocoder.geocodeAddressCalledReference)
        }
    }


    /// Provides the dictionary passed to `geocodeAddressDictionary(_:completionHandler:)`
    /// if called.
    public final var forwardGeocodeAddressDictionary: CLGeocoderAddressDictionary? {
        get {
            return loadEvidence(with: CLGeocoder.geocodeAddressDictionaryReference) as? CLGeocoderAddressDictionary
        }
        set {
            let reference = CLGeocoder.geocodeAddressDictionaryReference
            guard let dictionary = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(dictionary, with: reference)
        }
    }


    /// Provides the string passed to `geocodeAddressString(_:completionHandler:)` if called.
    public final var forwardGeocodeAddressString: String? {
        get {
            return loadEvidence(with: CLGeocoder.geocodeAddressStringReference) as? String
        }
        set {
            let reference = CLGeocoder.geocodeAddressStringReference
            guard let string = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(string, with: reference)
        }
    }


    /// Provides the region passed to `geocodeAddressString(_:in:completionHandler:)` if called.
    public final var forwardGeocodeAddressRegion: CLRegion? {
        get {
            return loadEvidence(with: CLGeocoder.geocodeAddressRegionReference) as? CLRegion
        }
        set {
            let reference = CLGeocoder.geocodeAddressRegionReference
            guard let region = newValue else {
                return removeEvidence(with: reference)
            }

            saveEvidence(region, with: reference)
        }
    }


    /// Provides the completion handler passed to `geocodeAddressDictionary(_:completionHandler:)`,
    /// `geocodeAddressString(_:completionHandler:)` or
    /// `geocodeAddressString(_:in:completionHandler:)` if called.
    public final var forwardGeocodeAddressCompletionHandler: CLGeocodeCompletionHandler? {
        get {
            return loadEvidence(with: CLGeocoder.geocodeAddressCompletionHandlerReference) as? CLGeocodeCompletionHandler
        }
        set {
            let reference = CLGeocoder.geocodeAddressCompletionHandlerReference
            guard let handler = newValue else {
                return removeEvidence(with: reference)
            }
            
            saveEvidence(handler, with: reference)
        }
    }

}
