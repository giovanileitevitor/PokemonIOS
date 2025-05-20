//
//  Network.swift
//  Pokemon
//
//  Created by Pietro Rischi Nunes on 06/05/25.
//

import Foundation

enum NetworkErrors: Error {
    case url
    case request
}

class Network {
//    func fetchList(completion: @escaping ([PokemonDTO]) -> Void) throws {
//        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
//            throw NetworkErrors.url
//        }
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard let data else { return }
//            do {
//                let result = try JSONDecoder().decode(ResultDTO.self, from: data)
//                completion(result.results)
//            } catch {
//                throw NetworkErrors.request
//            }
//        }.resume()
//    }

    func fetchList() async throws -> [PokemonDTO] {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon") else {
            throw NetworkErrors.url
        }
        do {
            let (data, _) = try await URLSession.shared.data(for: .init(url: url))
            let result = try JSONDecoder().decode(ResultDTO.self, from: data)
            return result.results
        } catch {
            throw NetworkErrors.request
        }
    }
}
