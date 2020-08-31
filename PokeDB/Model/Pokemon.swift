//
//  InternalPokemon.swift
//  PokeDB
//
//  Created by Станислав Козлов on 31.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import Foundation

struct Pokemon: Codable
{
	let id: Int
	let name: String
	let url: URL
	let imageUrl: URL?
}

extension Pokemon: Equatable
{
	static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
		return lhs.id == rhs.id &&
			lhs.name == rhs.name &&
			lhs.url == rhs.url &&
			lhs.imageUrl == rhs.imageUrl
	}
}
