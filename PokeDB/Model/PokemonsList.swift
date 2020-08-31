//
//  PokemonsList.swift
//  PokeDB
//
//  Created by Станислав Козлов on 31.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import Foundation

struct PokemonsList: Codable
{
	let count: Int
	var next: URL?
	var previous: URL?
	let results: [NamedAPIResource]
}

extension PokemonsList: Equatable
{
	static func == (lhs: PokemonsList, rhs: PokemonsList) -> Bool {
		return lhs.count == rhs.count &&
			lhs.next == rhs.next &&
			lhs.previous == rhs.previous &&
			lhs.results == rhs.results
	}
}
