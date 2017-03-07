//
//  MutableFloor.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 3/6/17.
//  Copyright © 2017 Swagger Soft. All rights reserved.
//

import CoreLocation


/// Mutable subclass of `CLFloor` to be used for testing purposes.
open class MutableFloor: CLFloor {

    /// Mutable level on a floor.
    private final var _level: Int
    open override var level: Int {
        get {
            return _level
        }
        set {
            _level = newValue
        }
    }

    public init(level: Int) {
        _level = level
        super.init()
    }

    public required init?(coder: NSCoder) {
        _level = coder.decodeInteger(forKey: MutableFloor.levelEncodingKey)
        super.init(coder: coder)
    }

    private static let levelEncodingKey = "_level"
    open override func encode(with coder: NSCoder) {
        coder.encode(level, forKey: MutableFloor.levelEncodingKey)
    }

}
