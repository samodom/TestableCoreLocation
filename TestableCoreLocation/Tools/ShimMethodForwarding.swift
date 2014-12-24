//
//  ShimMethodForwarding.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/20/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import Foundation

public protocol ShimMethodForwarding {
    func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool
    func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool)
    var shouldForwardByDefault: Bool { get }
}

internal class ShimMethodForwardingList: ShimMethodForwarding {

    private var forwardingList = [Selector:Bool]()
    internal var shouldForwardByDefault: Bool

    internal init(shouldForwardByDefault: Bool) {
        self.shouldForwardByDefault = shouldForwardByDefault
    }

    internal func shouldForwardMethodCallWithSelector(selector: Selector) -> Bool {
        if let shouldForward = forwardingList[selector] {
            return shouldForward
        }
        else {
            return shouldForwardByDefault
        }
    }

    internal func setShouldForwardMethodCallWithSelector(selector: Selector, _ shouldForward: Bool) {
        forwardingList[selector] = shouldForward
    }

}
