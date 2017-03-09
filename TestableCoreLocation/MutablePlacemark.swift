//
//  MutablePlacemark.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/8/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation

open class MutablePlacemark: CLPlacemark {

    /// Mutable location of a placemark.
    private var _location: CLLocation?
    open override var location: CLLocation? {
        get { return _location }
        set { _location = newValue }
    }


    /// Mutable name of a placemark.
    private var _name: String?
    open override var name: String? {
        get { return _name }
        set { _name = newValue }
    }


    /// Mutable address dictionary of a placemark.
    private var _addressDictionary: CLGeocoderAddressDictionary?
    open override var addressDictionary: CLGeocoderAddressDictionary? {
        get { return _addressDictionary }
        set { _addressDictionary = newValue }
    }


    /// Mutable country code of a placemark.
    private var _isoCountryCode: String?
    open override var isoCountryCode: String? {
        get { return _isoCountryCode }
        set { _isoCountryCode = newValue }
    }


    /// Mutable country of a placemark.
    private var _country: String?
    open override var country: String? {
        get { return _country }
        set { _country = newValue }
    }


    /// Mutable postal code of a placemark.
    private var _postalCode: String?
    open override var postalCode: String? {
        get { return _postalCode }
        set { _postalCode = newValue }
    }


    /// Mutable administrative area of a placemark.
    private var _administrativeArea: String?
    open override var administrativeArea: String? {
        get { return _administrativeArea }
        set { _administrativeArea = newValue }
    }


    /// Mutable sub administrative area of a placemark.
    private var _subAdministrativeArea: String?
    open override var subAdministrativeArea: String? {
        get { return _subAdministrativeArea }
        set { _subAdministrativeArea = newValue }
    }


    /// Mutable locality of a placemark.
    private var _locality: String?
    open override var locality: String? {
        get { return _locality }
        set { _locality = newValue }
    }


    /// Mutable sub-locality of a placemark.
    private var _subLocality: String?
    open override var subLocality: String? {
        get { return _subLocality }
        set { _subLocality = newValue }
    }


    /// Mutable thoroughfare of a placemark.
    private var _thoroughfare: String?
    open override var thoroughfare: String? {
        get { return _thoroughfare }
        set { _thoroughfare = newValue }
    }


    /// Mutable sub-thoroughfare of a placemark.
    private var _subThoroughfare: String?
    open override var subThoroughfare: String? {
        get { return _subThoroughfare }
        set { _subThoroughfare = newValue }
    }


    /// Mutable region of a placemark.
    private var _region: CLRegion?
    open override var region: CLRegion? {
        get { return _region }
        set { _region = newValue }
    }


    /// Mutable time zone of a placemark.
    private var _timeZone: TimeZone?
    open override var timeZone: TimeZone? {
        get { return _timeZone }
        set { _timeZone = newValue }
    }


    /// Mutable inland water of a placemark.
    private var _inlandWater: String?
    open override var inlandWater: String? {
        get { return _inlandWater }
        set { _inlandWater = newValue }
    }


    /// Mutable ocean of a placemark.
    private var _ocean: String?
    open override var ocean: String? {
        get { return _ocean }
        set { _ocean = newValue }
    }


    /// Mutable areas of interest of a placemark.
    private var _areasOfInterest: [String]?
    open override var areasOfInterest: [String]? {
        get { return _areasOfInterest }
        set { _areasOfInterest = newValue }
    }


    public override init() {
        super.init()
    }

    private enum MutablePlacemarkEncodingKeys {
        static let location = "location"
        static let name = "name"
        static let addressDictionary = "addressDictionary"
        static let isoCountryCode = "isoCountryCode"
        static let country = "country"
        static let postalCode = "postalCode"
        static let administrativeArea = "administrativeArea"
        static let subAdministrativeArea = "subAdministrativeArea"
        static let locality = "locality"
        static let subLocality = "subLocality"
        static let thoroughfare = "thoroughfare"
        static let subThoroughfare = "subThoroughfare"
        static let region = "region"
        static let timeZone = "timeZone"
        static let inlandWater = "inlandWater"
        static let ocean = "ocean"
        static let areasOfInterest = "areasOfInterest"
    }

    public required init?(coder: NSCoder) {
        _location = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.location) as? CLLocation
        _name = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.name) as? String
        _addressDictionary = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.addressDictionary) as? CLGeocoderAddressDictionary
        _isoCountryCode = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.isoCountryCode) as? String
        _country = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.country) as? String
        _postalCode = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.postalCode) as? String
        _administrativeArea = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.administrativeArea) as? String
        _subAdministrativeArea = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.subAdministrativeArea) as? String
        _locality = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.locality) as? String
        _subLocality = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.subLocality) as? String
        _thoroughfare = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.thoroughfare) as? String
        _subThoroughfare = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.subThoroughfare) as? String
        _region = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.region) as? CLRegion
        _timeZone = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.timeZone) as? TimeZone
        _inlandWater = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.inlandWater) as? String
        _ocean = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.ocean) as? String
        _areasOfInterest = coder.decodeObject(forKey: MutablePlacemarkEncodingKeys.areasOfInterest) as? [String]

        super.init(coder: coder)
    }

    open override func encode(with coder: NSCoder) {
        coder.encode(location, forKey: MutablePlacemarkEncodingKeys.location)
        coder.encode(name, forKey: MutablePlacemarkEncodingKeys.name)
        coder.encode(addressDictionary, forKey: MutablePlacemarkEncodingKeys.addressDictionary)
        coder.encode(isoCountryCode, forKey: MutablePlacemarkEncodingKeys.isoCountryCode)
        coder.encode(country, forKey: MutablePlacemarkEncodingKeys.country)
        coder.encode(postalCode, forKey: MutablePlacemarkEncodingKeys.postalCode)
        coder.encode(administrativeArea, forKey: MutablePlacemarkEncodingKeys.administrativeArea)
        coder.encode(subAdministrativeArea, forKey: MutablePlacemarkEncodingKeys.subAdministrativeArea)
        coder.encode(locality, forKey: MutablePlacemarkEncodingKeys.locality)
        coder.encode(subLocality, forKey: MutablePlacemarkEncodingKeys.subLocality)
        coder.encode(thoroughfare, forKey: MutablePlacemarkEncodingKeys.thoroughfare)
        coder.encode(subThoroughfare, forKey: MutablePlacemarkEncodingKeys.subThoroughfare)
        coder.encode(region, forKey: MutablePlacemarkEncodingKeys.region)
        coder.encode(timeZone, forKey: MutablePlacemarkEncodingKeys.timeZone)
        coder.encode(inlandWater, forKey: MutablePlacemarkEncodingKeys.inlandWater)
        coder.encode(ocean, forKey: MutablePlacemarkEncodingKeys.ocean)
        coder.encode(areasOfInterest, forKey: MutablePlacemarkEncodingKeys.areasOfInterest)
    }

}
