//
//  PokemonDetail.swift
//  Pokemon
//
//  Created by Giovani Leite Vitor on 5/27/25.
//

import Foundation

struct PokemonDetail: Identifiable {
    let id = UUID()
    
    let types: [PokemonDetailTypes]
}
