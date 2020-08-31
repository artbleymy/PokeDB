//
//  ServiceError.swift
//  PokeDB
//
//  Created by Станислав Козлов on 27.08.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

enum ServiceError: Error
{
	case httpError(Int)
	case networkError(Error)
	case dataError
	case parsingError(Error)
	case httpResponseError
}
