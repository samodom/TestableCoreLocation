//
//  MutablePlacemarkTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/8/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import XCTest
import CoreLocation
import Contacts
import TestableCoreLocation


class MutablePlacemarkTests: XCTestCase {

    var mutablePlacemark: MutablePlacemark!
    var placemark: CLPlacemark!
    let timeZone = TimeZone(identifier: "MDT")
    let areasOfInterest = ["LoDo", "RiNo", "LoHi"]

    override func setUp() {
        super.setUp()

        mutablePlacemark = MutablePlacemark()
        placemark = mutablePlacemark
    }

    func testLocationIsMutable() {
        mutablePlacemark.location = SampleLocation
        XCTAssertEqual(placemark.location, SampleLocation,
                       "Should be able to change the location of a placemark")
    }

    func testNameIsMutable() {
        mutablePlacemark.name = "Nowhere special"
        XCTAssertEqual(placemark.name, "Nowhere special",
                       "Should be able to change the name of a placemark")
    }

    func testAddressDictionaryIsMutable() {
        mutablePlacemark.addressDictionary = SampleAddressDictionary
        XCTAssertEqual(
            placemark.addressDictionary as! [String: String],
            SampleAddressDictionary as! [String: String],
            "Should be able to change the address dictionary of a placemark"
        )
    }

    func testCountryCodeIsMutable() {
        mutablePlacemark.isoCountryCode = "NL"
        XCTAssertEqual(placemark.isoCountryCode, "NL",
                       "Should be able to change the country code of a placemark")
    }

    func testCountryIsMutable() {
        mutablePlacemark.country = "The Netherlands"
        XCTAssertEqual(placemark.country, "The Netherlands",
                       "Should be able to change the country of a placemark")
    }

    func testPostalCodeIsMutable() {
        mutablePlacemark.postalCode = "80202"
        XCTAssertEqual(placemark.postalCode, "80202",
                       "Should be able to change the postal code of a placemark")
    }

    func testAdministrativeAreaIsMutable() {
        mutablePlacemark.administrativeArea = "Colorado"
        XCTAssertEqual(placemark.administrativeArea, "Colorado",
                       "Should be able to change the administrative area of a placemark")
    }

    func testSubAdministrativeAreaIsMutable() {
        mutablePlacemark.subAdministrativeArea = "Denver"
        XCTAssertEqual(placemark.subAdministrativeArea, "Denver",
                       "Should be able to change the administrative area of a placemark")
    }

    func testLocalityIsMutable() {
        mutablePlacemark.locality = "Denver"
        XCTAssertEqual(placemark.locality, "Denver",
                       "Should be able to change the locality of a placemark")
    }

    func testSubLocalityIsMutable() {
        mutablePlacemark.subLocality = "LoDo"
        XCTAssertEqual(placemark.subLocality, "LoDo",
                       "Should be able to change the sub-locality of a placemark")
    }

    func testThoroughfareIsMutable() {
        mutablePlacemark.thoroughfare = "Speer Blvd."
        XCTAssertEqual(placemark.thoroughfare, "Speer Blvd.",
                       "Should be able to change the thoroughfare of a placemark")
    }

    func testSubThoroughfareIsMutable() {
        mutablePlacemark.subThoroughfare = "Speer Blvd."
        XCTAssertEqual(placemark.subThoroughfare, "Speer Blvd.",
                       "Should be able to change the sub-thoroughfare of a placemark")
    }

    func testRegionIsMutable() {
        mutablePlacemark.region = SampleRegion
        XCTAssertEqual(placemark.region, SampleRegion,
                       "Should be able to change the region of a placemark")
    }

    func testTimeZoneIsMutable() {
        mutablePlacemark.timeZone = timeZone
        XCTAssertEqual(placemark.timeZone, timeZone,
                       "Should be able to change the time zone of a placemark")
    }

    func testInlandWaterIsMutable() {
        mutablePlacemark.inlandWater = "Loch Ness"
        XCTAssertEqual(placemark.inlandWater, "Loch Ness",
                       "Should be able to change the inland water of a placemark")
    }

    func testOceanIsMutable() {
        mutablePlacemark.ocean = "Pacific"
        XCTAssertEqual(placemark.ocean, "Pacific",
                       "Should be able to change the ocean of a placemark")
    }

    func testAreasOfInterestAreMutable() {
        mutablePlacemark.areasOfInterest = areasOfInterest
        XCTAssertEqual(placemark.areasOfInterest!, areasOfInterest,
                       "Should be able to change the areas of interest of a placemark")
    }

    func testPlacemarkSerialization() {
        mutablePlacemark.location = SampleLocation
        mutablePlacemark.name = "Nowhere special"
        mutablePlacemark.addressDictionary = SampleAddressDictionary
        mutablePlacemark.isoCountryCode = "NL"
        mutablePlacemark.country = "The Netherlands"
        mutablePlacemark.postalCode = "80202"
        mutablePlacemark.administrativeArea = "Colorado"
        mutablePlacemark.subAdministrativeArea = "Denver"
        mutablePlacemark.locality = "Denver"
        mutablePlacemark.subLocality = "LoDo"
        mutablePlacemark.thoroughfare = "Speer Blvd."
        mutablePlacemark.subThoroughfare = "Speer Blvd."
        mutablePlacemark.region = SampleRegion
        mutablePlacemark.timeZone = timeZone
        mutablePlacemark.inlandWater = "Loch Ness"
        mutablePlacemark.ocean = "Pacific"
        mutablePlacemark.areasOfInterest = areasOfInterest

        let data = NSKeyedArchiver.archivedData(withRootObject: placemark)
        let anotherPlacemark = NSKeyedUnarchiver.unarchiveObject(with: data) as! CLPlacemark

        XCTAssertEqual(anotherPlacemark.location?.coordinate, SampleLocation.coordinate,
                       "Should be able to change the location of a placemark")
        XCTAssertEqual(anotherPlacemark.name, "Nowhere special",
                       "Should be able to change the name of a placemark")
        XCTAssertEqual(
            anotherPlacemark.addressDictionary as! [String: String],
            SampleAddressDictionary as! [String: String],
            "Should be able to change the address dictionary of a placemark"
        )
        XCTAssertEqual(anotherPlacemark.isoCountryCode, "NL",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.country, "The Netherlands",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.postalCode, "80202",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.administrativeArea, "Colorado",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.subAdministrativeArea, "Denver",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.locality, "Denver",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.subLocality, "LoDo",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.thoroughfare, "Speer Blvd.",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.subThoroughfare, "Speer Blvd.",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.region, SampleRegion,
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.timeZone, timeZone,
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.inlandWater, "Loch Ness",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.ocean, "Pacific",
                       "Should be able to serialize and deserialize a mutable placemark")
        XCTAssertEqual(anotherPlacemark.areasOfInterest!, areasOfInterest,
                       "Should be able to serialize and deserialize a mutable placemark")
    }

}
