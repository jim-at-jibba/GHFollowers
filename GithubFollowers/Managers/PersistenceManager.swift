//
//  PersistenceManager.swift
//  GithubFollowers
//
//  Created by James Best on 28/07/2023.
//

import Foundation

enum PersistanceActionType {
    case add, remove
}

// Using enum rather than a struct as you can create an
// empty struct
enum PersistanceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistanceActionType, completed: @escaping(GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrieveFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrieveFavorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    retrieveFavorites.append(favorite)
                    
                case .remove:
                    retrieveFavorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: retrieveFavorites))
            case .failure(let error):
                completed(error)
            }
            
        }
    }
    
    // We are using a Result type here because we are storing a custom data type Follower
    // which needs to be decoded/coded and this process may fail
    // Standard data types dont need this
    static func retrieveFavorites(completed: @escaping(Result<[Follower], GFError>) -> Void) {
        // casting to Data to help swift
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            // Returning empty array as this is the first time accessing our store
            completed(.success([]))
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
    
}
