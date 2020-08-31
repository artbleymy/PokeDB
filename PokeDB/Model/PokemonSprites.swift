//
//  PokemonSprites.swift
//  PokeDB
//
//  Created by Станислав Козлов on 23.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import Foundation

struct PokemonSprites: Codable, Equatable
{
	var frontDefault: URL?

	private enum CodingKeys: String, CodingKey
	{
		case frontDefault = "front_default"
	}
}
