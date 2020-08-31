//
//  NetworkServiceTest.swift
//  PokeDBTests
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

import XCTest
@testable import PokeDB

final class NetworkServiceTests: XCTestCase
{
	func testNetworkService() {
		let pokemonsList = PokemonsList(count: 1050,
										next: URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=20&limit=20"),
										previous: nil,
										results: [
											NamedAPIResource(name: "bulbasaur", url: URL(string: "https://pokeapi.co/api/v2/pokemon/1/")),
											NamedAPIResource(name: "ivysaur", url: URL(string: "https://pokeapi.co/api/v2/pokemon/2/")),
		])

		let networkService = NetworkServiceMock(response: "pokemons_list")

		networkService.request(to: .pokemonsList) { (result: Result<PokemonsList, ServiceError>, _) in
			switch result {
			case .success(let pokemons):
				XCTAssertEqual(pokemons, pokemonsList)
			case .failure:
				XCTAssert(false, "Network service failed")
			}
		}
	}

	func testNetworkServideParsingError() {
		let networkService = NetworkServiceMock(response: "pokemons_list_invalid")
		networkService.request(to: .pokemonsList) { (result: Result<PokemonsList, ServiceError>, _) in
			switch result {
			case .failure(.parsingError):
				return
			default:
				XCTAssert(false, "Network service parsing error failed")
			}
		}
	}
}
