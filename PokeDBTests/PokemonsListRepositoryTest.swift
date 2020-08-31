//
//  PokemonsListRepositoryTest.swift
//  PokeDBTests
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
// swiftlint:disable force_unwrapping

import XCTest
@testable import PokeDB

final class PokemonsListRepositoryTest: XCTestCase
{
	func testPokemonsListRepository() {
		let pokemonsList = [
			Pokemon(id: 1,
					name: "bulbasaur",
					url: URL(string: "https://pokeapi.co/api/v2/pokemon/1/")!,
					imageUrl: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png")!),
			Pokemon(id: 2,
					name: "ivysaur",
					url: URL(string: "https://pokeapi.co/api/v2/pokemon/2/")!,
					imageUrl: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png")!),
		]

		let pokemonsListRepository = PokemonsListRepositoryMock()

		pokemonsListRepository.loadPokemons { (result: Result<[Pokemon], ServiceError>) in
			switch result {
			case .success(let pokemons):
				XCTAssertEqual(pokemons, pokemonsList)
			case .failure:
				XCTAssert(false, "PokemonsListRepository failed")
			}
		}
	}
}
