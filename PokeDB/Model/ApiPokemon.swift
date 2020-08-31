//
//  ApiPokemon.swift
//  PokeDB
//
//  Created by Станислав Козлов on 23.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

struct ApiPokemon: Codable, Equatable
{
	let id: Int
	let name: String
	let order: Int
	let sprites: PokemonSprites

	static func == (lhs: ApiPokemon, rhs: ApiPokemon) -> Bool {
		return lhs.id == rhs.id &&
			lhs.name == rhs.name &&
			lhs.order == rhs.order &&
			lhs.sprites == rhs.sprites
	}
}
