import SwiftUI

struct ContentView: View {
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        NavigationStack {
            List(pokemons) { pokemon in
                PokemonCard(pokemon: pokemon)
                .background(
                    NavigationLink(String()) {
                        DetailView(pokemon: pokemon)
                    }
                    .opacity(0)
                )
                .listRowSeparator(.hidden)
                .swipeActions(edge: .leading) {
                    Button(action: { } ){
                        Label("Delete", systemImage: "star")
                    }
                }
            }.navigationTitle(Text("Pokedex"))
            .listStyle(.plain)
            .onAppear {
                guard pokemons.isEmpty else { return }
                Task {
                    do {
                        let pokemonsData = try await Network.shared.fetchList()
                        pokemons = pokemonsData.enumerated().map { (index, data) in
                            Pokemon(data: data, cover: .init(indexImage: index + 1))
                        }
                    } catch {
                        print(error)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
