//
//  JSONReader.swift
//  PokeDBTests
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import Foundation

final class JSONFileReader
{
	func read(resource: String) -> String {
		guard let mainBundlePath = Bundle(for: type(of: self)).resourcePath else {
			return ""
		}
		let apiBundle = Bundle(path: mainBundlePath + "/ApiMock.bundle/")
		if let filepath = apiBundle?.path(forResource: resource, ofType: "json") {
			do {
				let content = try String(contentsOfFile: filepath)
				return content
			}
			catch {
				return ""
			}
		}
		else {
			return ""
		}
	}
}
