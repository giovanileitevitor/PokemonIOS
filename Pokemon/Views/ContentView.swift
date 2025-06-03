import SwiftUI

struct ContentView: View {
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                    ForEach(pokemons) { pokemon in
                        NavigationLink(destination: DetailView(pokemon: pokemon)) {
                            Text(pokemon.data.name)
                                .background(Color.red)
                                .cornerRadius(6)
                                .padding(10)
                        }
                    }
                }.padding()
                    .navigationTitle(Text("Pokedex"))
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
}

#Preview {
    ContentView()
}
