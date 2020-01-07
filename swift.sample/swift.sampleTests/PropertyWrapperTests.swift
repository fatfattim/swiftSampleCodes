//
//  PropertyWrapperTests.swift
//  swift.sampleTests
//
//  Created by Tim Chen on 2020/1/7.
//  Copyright © 2020 fatfattim. All rights reserved.
//

import XCTest
@testable import swift_sample

class PropertyWrapperTests: XCTestCase {

    override func setUp() {
        reset()
    }

    override func tearDown() {
        reset()
    }
    
    private func reset() {
        GlobalSettings.reset()
    }

    func testExample() {
        // To test default value
        XCTAssertFalse(GlobalSettings.r20FeatureEnabled)
        XCTAssertEqual(GlobalSettings.videoQuality, "1080p")
        
        GlobalSettings.r20FeatureEnabled = true
        XCTAssertTrue(GlobalSettings.r20FeatureEnabled)
        GlobalSettings.videoQuality = "720p"
        XCTAssertEqual(GlobalSettings.videoQuality, "720p")
    }

}
