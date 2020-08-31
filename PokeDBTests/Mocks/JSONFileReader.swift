//
//  JSONReader.swift
//  PokeDBTests
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import XCTest

final class JSONFileReader
{
	func read(resource: String) -> String {
		guard let mainBundlePath = Bundle(for: type(of: self)).resourcePath,
			let bundle = Bundle(path: mainBundlePath + "/ApiMock.bundle/"),
			let filepath = bundle.path(forResource: resource, ofType: "json")
		else {
			XCTAssert(false, "Bundle error")
			return ""
		}
		do {
			let content = try String(contentsOfFile: filepath)
			return content
		}
		catch {
			XCTAssert(false, "Cant read mock file")
			return ""
		}
	}
}
