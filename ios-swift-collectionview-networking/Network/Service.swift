//
//  Service.swift
//  ios-swift-collectionview-networking
//
//  Created by Otavio Brito on 12/5/2025.
//

import Foundation

class Service {
    
    static let shared = Service()
    let BASE_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    func fetchCollection() {
        
        guard let url = URL(string: BASE_URL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // handle error
            if let error = error {
                print("failed to fetch data with error:", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                guard let resultArray = try JSONSerialization.jsonObject(with: data, options: []) as? [AnyObject] else { return }
                
                for (key, result) in resultArray.enumerated() {
                    if let dictionary = result as? [String: AnyObject] {
                        let pokemon = CollectionModel(id: key, dictionary: dictionary)
                        print(pokemon.name)
                    }
                }
                
            } catch let error {
                print("failed to create json with error:", error.localizedDescription)
            }
        }.resume()
    }
}
    

