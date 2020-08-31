//
//  NetworkServiceMock.swift
//  PokeDBTests
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
import Foundation
@testable import PokeDB

final class NetworkServiceMock: INetworkService
{
	let response: String

	init(response: String) {
		self.response = response
	}

	func request<T: Decodable>(to endpoint: Endpoint, completion: @escaping (Result<T, ServiceError>) -> Void) {
		let reader = JSONFileReader()
  		let data = Data(reader.read(resource: response).utf8)

		do {
			let resultData = try JSONDecoder().decode(T.self, from: data)
			completion(.success(resultData))
		}
		catch {
			completion(.failure(.parsingError(error)))
		}
	}
}
