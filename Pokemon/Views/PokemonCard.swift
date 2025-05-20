//
//  PokemonCard.swift
//  Pokemon
//
//  Created by Pietro Rischi Nunes on 13/05/25.
//

import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack {
            Text(pokemon.data.name)
            .font(.title)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 150)
        .background(
            AsyncImage(url: pokemon.cover.image)
        )
        .cornerRadius(16)
    }
}

#Preview {
    PokemonCard(pokemon: .init(data: .init(name: "Pikachu"), cover: .init(indexImage: 1)))
}
