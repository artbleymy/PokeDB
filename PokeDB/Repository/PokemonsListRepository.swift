//
//  PokemonsListRepository.swift
//  PokeDB
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

protocol IPokemonsListRepository
{
	func loadPokemons(completion: @escaping (Result<[Pokemon], ServiceError>) -> Void)
}

final class PokemonsListRepository: IPokemonsListRepository
{
	let networkService: INetworkService

	init(networkService: INetworkService) {
		self.networkService = networkService
	}

	func loadPokemons(completion: @escaping (Result<[Pokemon], ServiceError>) -> Void) {
		self.networkService.request(to: .pokemon, completion: completion)
	}
}
