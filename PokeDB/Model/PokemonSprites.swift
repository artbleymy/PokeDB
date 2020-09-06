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
	let frontDefault: URL?
	let frontFemale: URL?
	let frontShiny: URL?
	let frontShinyFemale: URL?
	let backDefault: URL?
	let backFemale: URL?
	let backShiny: URL?
	let backShinyFemale: URL?

	init(frontDefault: URL? = nil,
		 frontFemale: URL? = nil,
		 frontShiny: URL? = nil,
		 frontShinyFemale: URL? = nil,
		 backDefault: URL? = nil,
		 backFemale: URL? = nil,
		 backShiny: URL? = nil,
		 backShinyFemale: URL? = nil) {

		self.frontDefault = frontDefault
		self.frontFemale = frontFemale
		self.frontShiny = frontShiny
		self.frontShinyFemale = frontShinyFemale
		self.backDefault = backDefault
		self.backFemale = backFemale
		self.backShiny = backShiny
		self.backShinyFemale = backShinyFemale
	}

	private enum CodingKeys: String, CodingKey
	{
		case frontDefault = "front_default"
		case frontFemale = "front_female"
		case frontShiny = "front_shiny"
		case frontShinyFemale = "front_shiny_female"
		case backDefault = "back_default"
		case backFemale = "back_female"
		case backShiny = "back_shiny"
		case backShinyFemale = "back_shiny_female"
	}
}
