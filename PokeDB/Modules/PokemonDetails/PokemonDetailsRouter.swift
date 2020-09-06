//
//  PokemonDetailsRouter.swift
//  PokeDB
//
//  Created by Станислав Козлов on 06.09.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//

protocol IPokemonDetailsRouter: AnyObject
{
	func back()
}

final class PokemonDetailsRouter: IPokemonDetailsRouter
{
	func back() {
		print("back")
	}
}
