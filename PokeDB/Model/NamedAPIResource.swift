//
//  NamedAPIResource.swift
//  PokeDB
//
//  Created by Станислав Козлов on 31.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import Foundation

struct NamedAPIResource: Codable
{
	let name: String
	let url: URL?
}

extension NamedAPIResource: Equatable
{
	static func == (lhs: NamedAPIResource, rhs: NamedAPIResource) -> Bool {
		return lhs.name == rhs.name && lhs.url == rhs.url
	}
}
