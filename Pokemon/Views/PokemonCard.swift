
import SwiftUI

struct PokemonCard: View {
    var pokemon: Pokemon
    
    var body: some View {
        VStack() {
            HStack(alignment: .center, spacing: 10){
                Spacer()
                Text("#" + "0001" ).padding(10)
            }
            Spacer()
            VStack(alignment: .leading){
                Text(pokemon.data.name.capitalized)
                    .font(.custom("HelveticaNeue", size: 16))
                    .font(.title)
            }
            .frame(maxWidth: .infinity)
            .background(
                .white
                    .opacity(0.6)
            )
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 120)
        .background(
            AsyncImage(url: pokemon.cover.image)
        )
        .cornerRadius(8)
    }
}

#Preview {
    PokemonCard(
        pokemon: .init(data: .init(name: "Pikachu"),cover: .init(indexImage: 1))
    )
}

