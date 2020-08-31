//
//  PokemonsListRepository.swift
//  PokeDB
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

protocol IPokemonsListRepository
{
	func loadPokemons(completion: @escaping (Result<PokemonsList, ServiceError>) -> Void)
}

final class PokemonsListRepository: IPokemonsListRepository
{
	let networkService: INetworkService

	init(networkService: INetworkService) {
		self.networkService = networkService
	}

	func loadPokemons(completion: @escaping (Result<PokemonsList, ServiceError>) -> Void) {
		self.networkService.request(to: .pokemonsList) { (result: Result<PokemonsList, ServiceError>)  in
			switch result {
			case .success(let pokemonsList):
				let completionHandler: (Result<Pokemon, ServiceError>) -> Void = { result in
					switch result {
					case .success(let pokemon):
						print("\(pokemon.name) \(pokemon.id) \(pokemon.sprites)")
					default:
						print("Error1")
					}
				}
				pokemonsList.results.forEach {
					print("URL: \($0.url)")
					self.networkService.request(from: $0.url, completion: completionHandler)
				}
			default : print("Error2")
			}
		}
	}
}
