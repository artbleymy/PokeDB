//
//  PokeDBUITests.swift
//  PokeDBUITests
//
//  Created by Станислав Козлов on 18.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import XCTest

final class PokeDBUITests: XCTestCase
{
	override func setUpWithError() throws {
		continueAfterFailure = false
	}

	override func tearDownWithError() throws {
	}

	func testUIExample1() throws {
		let app = XCUIApplication()
		app.launch()
	}

	func testUIExample2() throws {
		let app = XCUIApplication()
		app.launch()
	}
}
