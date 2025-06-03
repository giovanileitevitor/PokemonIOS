import SwiftUI

struct DetailView: View {
    let pokemon: Pokemon
    @State var detail: PokemonDetail?
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: pokemon.cover.image) { image in
                    image.image?.resizable()
                }
                .padding(12)
                .background(.yellow)
                .frame(width: 120, height: 120)
                .clipShape(.circle)
                VStack(alignment: .leading) {
                    Text(pokemon.data.name.capitalized)
                    HStack {
                        if let detail {
                            ForEach(detail.types) { detail in
                                Text(detail.name)
                            }
                        }
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .padding(16)
        .onAppear {
            Task {
                do {
                    let pokemonDetail = try await Network.shared.fetchDetail(name: pokemon.data.name)
                    detail = PokemonDetail(types: pokemonDetail.types.map({ detail in
                        PokemonDetailTypes(name: detail.type.name)
                    }))
                } catch {
                    
                }
            }
        }
    }
}

#Preview {
    DetailView(pokemon: .init(data: .init(name: "Bulbasaur"), cover: .init(indexImage: 1)), detail: nil)
}

