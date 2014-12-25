//
//  ShimMethodForwardingListTests.swift
//  TestableCoreLocation
//
//  Created by Sam Odom on 12/21/14.
//  Copyright (c) 2014 Swagger Soft. All rights reserved.
//

import XCTest

class ShimMethodForwardingListTests: XCTestCase {

    var forwardingList: ShimMethodForwardingList!

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func testForwardingListWithDefaultForwarding() {
        forwardingList = ShimMethodForwardingList(shouldForwardByDefault: true)
        XCTAssertTrue(forwardingList.shouldForwardByDefault, "This forwarding list should forward shim methods by default")
        XCTAssertTrue(forwardingList.shouldForwardMethodCallWithSelector("someSelector"), "All methods should be forwarded by default")
        forwardingList.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(forwardingList.shouldForwardMethodCallWithSelector("someSelector"), "The selector should not be forwarded now")
        forwardingList.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(forwardingList.shouldForwardMethodCallWithSelector("someSelector"), "The selector should now be forwarded again")
    }

    func testForwardingListWithDefaultNonForwarding() {
        forwardingList = ShimMethodForwardingList(shouldForwardByDefault: false)
        XCTAssertFalse(forwardingList.shouldForwardByDefault, "This forwarding list should not forward shim methods by default")
        XCTAssertFalse(forwardingList.shouldForwardMethodCallWithSelector("someSelector"), "All methods should not be forwarded by default")
        forwardingList.setShouldForwardMethodCallWithSelector("someSelector", true)
        XCTAssertTrue(forwardingList.shouldForwardMethodCallWithSelector("someSelector"), "The selector should now be forwarded now")
        forwardingList.setShouldForwardMethodCallWithSelector("someSelector", false)
        XCTAssertFalse(forwardingList.shouldForwardMethodCallWithSelector("someSelector"), "The selector should not be forwarded again")
    }

}
