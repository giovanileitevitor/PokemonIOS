
import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack() {
            Spacer()
            VStack(alignment: .leading) {
                Text(pokemon.data.name.capitalized)
                    .font(.title)
                    .font(.system(size: 24, weight: .bold, design: .default))
            }
            .frame(maxWidth: .infinity)
            .background(
                .white
                    .opacity(0.6)
            )
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 100)
        .background(
            AsyncImage(url: pokemon.cover.image)
        )
        .cornerRadius(16)
    }
}

#Preview {
    PokemonCard(pokemon: .init(data: .init(name: "Pikachu"), cover: .init(indexImage: 1)))
}

