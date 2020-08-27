//
//  Pokemon.swift
//  PokeDB
//
//  Created by Станислав Козлов on 23.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

struct Pokemon: Codable
{
	let id: Int?
	let name: String?
	let order: Int?
	let sprites: [PokemonSprites]
}
