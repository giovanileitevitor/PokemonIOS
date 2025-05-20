//
//  DetailViewl.swift
//  Pokemon
//
//  Created by Pietro Rischi Nunes on 13/05/25.
//

import SwiftUI

struct DetailView: View {
    var pokemon: Pokemon
    
    var body: some View {
        Text(pokemon.data.name)
    }
}

#Preview {
    DetailView(pokemon: .init(data: .init(name: "Pikachu"), cover: .init(indexImage: 1)))
}
