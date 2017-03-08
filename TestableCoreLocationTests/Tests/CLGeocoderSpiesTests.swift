//
//  CLGeocoderSpiesTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/8/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import CoreLocation
import TestableCoreLocation


class CLGeocoderSpiesTests: XCTestCase {

    let geocoder = TestGeocoder()


    // MARK: - `reverseGeocodeLocation(_:completionHandler:)`

    func testSpyingOnReverseGeocodeLocation() {
        XCTAssertFalse(CLGeocoder.ReverseGeocodeLocationSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(geocoder.reverseGeocodeLocationCalled,
                       "By default the geocoder should not indicate having been asked to reverse-geocode a location")
        XCTAssertNil(geocoder.reverseGeocodeLocationLocation,
                     "By default there should be no captured location")
        XCTAssertNil(geocoder.reverseGeocodeLocationCompletionHandler,
                     "By default there should be no captured completion handler")

        let spy = CLGeocoder.ReverseGeocodeLocationSpyController.createSpy(on: geocoder)!
        spy.beginSpying()

        var completionHandlerInvoked = false
        let completion: CLGeocodeCompletionHandler = { _, _ in
            completionHandlerInvoked = true
        }

        geocoder.reverseGeocodeLocation(SampleLocation, completionHandler: completion)

        XCTAssertTrue(geocoder.reverseGeocodeLocationCalled,
                      "The geocoder should indicate having been asked to reverse-geocode a location")
        XCTAssertEqual(geocoder.reverseGeocodeLocationLocation, SampleLocation,
                       "The location should be captured")
        XCTAssertFalse(geocoder.reverseGeocodeLocationTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        XCTAssertFalse(completionHandlerInvoked,
                       "The spy method should not forward the method call to the original implementation")
        geocoder.reverseGeocodeLocationCompletionHandler!(nil, nil)
        XCTAssertTrue(completionHandlerInvoked, "The completion handler should be captured")

        spy.endSpying()

        XCTAssertFalse(geocoder.reverseGeocodeLocationCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(geocoder.reverseGeocodeLocationLocation,
                     "The location should be cleared after spying is complete")
        XCTAssertNil(geocoder.reverseGeocodeLocationCompletionHandler,
                     "The completion handler should be cleared after spying is complete")
    }


    // MARK: - `geocodeAddressDictionary(_:completionHandler:)`, `geocodeAddressString(_:completionHandler:)` and `geocodeAddressString(_:in:completionHandler:)`

    func testForwardGeocodingSpyMethodForwarding() {
        XCTAssertFalse(CLGeocoder.ForwardGeocodeAddressSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
    }

    func testSpyingOnGeocodeAddressDictionary() {
        XCTAssertFalse(geocoder.forwardGeocodeAddressCalled,
                       "By default the geocoder should not indicate having been asked to forward-geocode an address")
        XCTAssertNil(geocoder.forwardGeocodeAddressDictionary,
                     "By default there should be no captured dictionary")
        XCTAssertNil(geocoder.forwardGeocodeAddressCompletionHandler,
                     "By default there should be no captured completion handler")

        let spy = CLGeocoder.ForwardGeocodeAddressSpyController.createSpy(on: geocoder)!
        spy.beginSpying()

        var completionHandlerInvoked = false
        let completion: CLGeocodeCompletionHandler = { _, _ in
            completionHandlerInvoked = true
        }

        let dictionary: CLGeocoderAddressDictionary = ["a": "b"]
        geocoder.geocodeAddressDictionary(dictionary, completionHandler: completion)

        XCTAssertTrue(geocoder.forwardGeocodeAddressCalled,
                      "The geocoder should indicate having been asked to forward-geocode an address")
        XCTAssertEqual(
            geocoder.forwardGeocodeAddressDictionary as! [String: String],
            dictionary as! [String: String],
            "The dictionary should be captured"
        )
        XCTAssertFalse(geocoder.geocodeAddressDictionaryTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        XCTAssertFalse(completionHandlerInvoked,
                       "The spy method should not forward the method call to the original implementation")
        geocoder.forwardGeocodeAddressCompletionHandler!(nil, nil)
        XCTAssertTrue(completionHandlerInvoked, "The completion handler should be captured")

        spy.endSpying()

        XCTAssertFalse(geocoder.forwardGeocodeAddressCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(geocoder.forwardGeocodeAddressDictionary,
                     "The dictionary should be cleared after spying is complete")
        XCTAssertNil(geocoder.forwardGeocodeAddressCompletionHandler,
                     "The completion handler should be cleared after spying is complete")
    }

    func testSpyingOnGeocodeAddressString() {
        XCTAssertFalse(geocoder.forwardGeocodeAddressCalled,
                       "By default the geocoder should not indicate having been asked to forward-geocode an address")
        XCTAssertNil(geocoder.forwardGeocodeAddressString,
                     "By default there should be no captured string")
        XCTAssertNil(geocoder.forwardGeocodeAddressCompletionHandler,
                     "By default there should be no captured completion handler")

        let spy = CLGeocoder.ForwardGeocodeAddressSpyController.createSpy(on: geocoder)!
        spy.beginSpying()

        var completionHandlerInvoked = false
        let completion: CLGeocodeCompletionHandler = { _, _ in
            completionHandlerInvoked = true
        }

        geocoder.geocodeAddressString("sample address", completionHandler: completion)

        XCTAssertTrue(geocoder.forwardGeocodeAddressCalled,
                      "The geocoder should indicate having been asked to forward-geocode an address")
        XCTAssertEqual(geocoder.forwardGeocodeAddressString, "sample address",
                       "The string should be captured")
        XCTAssertFalse(geocoder.geocodeAddressStringTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        XCTAssertFalse(completionHandlerInvoked,
                       "The spy method should not forward the method call to the original implementation")
        geocoder.forwardGeocodeAddressCompletionHandler!(nil, nil)
        XCTAssertTrue(completionHandlerInvoked, "The completion handler should be captured")

        spy.endSpying()

        XCTAssertFalse(geocoder.forwardGeocodeAddressCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(geocoder.forwardGeocodeAddressString,
                     "The string should be cleared after spying is complete")
        XCTAssertNil(geocoder.forwardGeocodeAddressCompletionHandler,
                     "The completion handler should be cleared after spying is complete")
    }

    func testSpyingOnGeocodeAddressStringInRegion() {
        XCTAssertFalse(geocoder.forwardGeocodeAddressCalled,
                       "By default the geocoder should not indicate having been asked to forward-geocode an address")
        XCTAssertNil(geocoder.forwardGeocodeAddressString,
                     "By default there should be no captured string")
        XCTAssertNil(geocoder.forwardGeocodeAddressRegion,
                     "By default there should be no captured region")
        XCTAssertNil(geocoder.forwardGeocodeAddressCompletionHandler,
                     "By default there should be no captured completion handler")

        let spy = CLGeocoder.ForwardGeocodeAddressSpyController.createSpy(on: geocoder)!
        spy.beginSpying()

        var completionHandlerInvoked = false
        let completion: CLGeocodeCompletionHandler = { _, _ in
            completionHandlerInvoked = true
        }

        geocoder.geocodeAddressString(
            "sample address",
            in: SampleRegion,
            completionHandler: completion
        )

        XCTAssertTrue(geocoder.forwardGeocodeAddressCalled,
                      "The geocoder should indicate having been asked to forward-geocode an address")
        XCTAssertEqual(geocoder.forwardGeocodeAddressString, "sample address",
                       "The string should be captured")
        XCTAssertEqual(geocoder.forwardGeocodeAddressRegion, SampleRegion,
                       "The region should be captured")
        XCTAssertFalse(geocoder.geocodeAddressStringInRegionTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        XCTAssertFalse(completionHandlerInvoked,
                       "The spy method should not forward the method call to the original implementation")
        geocoder.forwardGeocodeAddressCompletionHandler!(nil, nil)
        XCTAssertTrue(completionHandlerInvoked, "The completion handler should be captured")

        spy.endSpying()

        XCTAssertFalse(geocoder.forwardGeocodeAddressCalled,
                       "The flag should be cleared after spying is complete")
        XCTAssertNil(geocoder.forwardGeocodeAddressString,
                     "The string should be cleared after spying is complete")
        XCTAssertNil(geocoder.forwardGeocodeAddressRegion,
                     "The region should be cleared after spying is complete")
        XCTAssertNil(geocoder.forwardGeocodeAddressCompletionHandler,
                     "The completion handler should be cleared after spying is complete")
    }


    // MARK: - `cancelGeocode`

    func testSpyingOnCancelGeocode() {
        XCTAssertFalse(CLGeocoder.CancelGeocodeSpyController.forwardsInvocations,
                       "The spy controller should not indicate that it forwards spy method invocations")
        XCTAssertFalse(geocoder.cancelGeocodeCalled,
                       "By default the geocoder should not indicate having been asked to cancelGeocode geocoding")

        let spy = CLGeocoder.CancelGeocodeSpyController.createSpy(on: geocoder)!
        spy.beginSpying()

        geocoder.cancelGeocode()

        XCTAssertTrue(geocoder.cancelGeocodeCalled,
                      "The location geocoder should indicate having been asked to cancelGeocode geocoding")
        XCTAssertFalse(geocoder.cancelGeocodeTestMethodCalled,
                       "The spy method should not forward the method call to the original implementation")

        spy.endSpying()

        XCTAssertFalse(geocoder.cancelGeocodeCalled,
                       "The flag should be cleared after spying is complete")
    }

}
