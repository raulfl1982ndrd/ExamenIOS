//
//  MovieProvider.swift
//  ExamenIOS
//
//  Created by Mañanas on 24/9/24.
//

import Foundation

class MovieProvider {

    static func findMoviesByName(_ name: String, withResult: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: "\(Constants.BASE_URL)&s=\(name)") else {
            print("URL not valid")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                // Handle the error
                print("Error: \(error.localizedDescription)")
                return
            } else if let data = data {
                // Process the data
/*                if let str = String(data: data, encoding: .utf8) {
                    print("Successfully decoded: \(str)")
                }*/
                let result = try! JSONDecoder().decode(MovieResponse.self, from: data)
                withResult(result.Search)
            }
        }
        task.resume()
    }
    static func findMoviesByName(_ name: String) async throws -> [Movie] {
        guard let url = URL(string: "\(Constants.BASE_URL)&s=\(name)") else {
            print("URL not valid")
            return []
        }
        print("buscando peliculas por nombre")
        print (url)
        let (data, response) = try await URLSession.shared.data(from: url)
        print(data.count)
        let result = try JSONDecoder().decode(MovieResponse.self, from: data)
        print("Numero de registros recuperados")
        
        return result.Search
    }
  /*
    static func findMovieByimdbID(_ imdbID: String) async throws -> MovieResponseimdbID {
        guard let url = URL(string: "\(Constants.BASE_URL)&i=\(imdbID)") else {
            print("URL not valid")
            return nil
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        let result = try JSONDecoder().decode(MovieResponseimdbID.self, from: data)
        return result
    }

*/
}
