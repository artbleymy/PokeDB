//
//  PokemonsHolder.swift
//  PokeDB
//
//  Created by Станислав Козлов on 06.09.2020.
//  Copyright © 2020 stanislavkozlov. All rights reserved.
//
protocol IPokemonsHolder: AnyObject
{
	var pokemons: [Pokemon] { get }

	func set(_ pokemons: [Pokemon])
}
final class PokemonsHolder: IPokemonsHolder
{
	private(set) var pokemons: [Pokemon]

	init() {
		self.pokemons = []
	}

	func set(_ pokemons: [Pokemon]) {
		self.pokemons = pokemons
	}
}
