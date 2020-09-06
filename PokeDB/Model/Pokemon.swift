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
	let sprites: PokemonSprites

	init(id: Int, name: String, url: URL, sprites: PokemonSprites) {
		self.id = id
		self.name = name
		self.url = url
		self.sprites = sprites
	}

	init(from pokemon: ApiPokemon, sourceUrl: URL) {
		self.init(id: pokemon.id, name: pokemon.name, url: sourceUrl, sprites: pokemon.sprites)
	}
}

extension Pokemon: Equatable
{
	static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
		return lhs.id == rhs.id &&
			lhs.name == rhs.name &&
			lhs.url == rhs.url &&
			lhs.sprites == rhs.sprites
	}
}
