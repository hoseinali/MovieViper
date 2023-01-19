//
//  Helper.swift
//  MovieViper
//
//  Created by hossein on 9/30/1401 AP.
//

import Foundation

struct Helper {
    static func updateFavorite(movie: Result, favorite: Bool, completion: @escaping () -> Void) {
        if favorite {
            FavoriteDB.share.remove(id: movie.id)
            completion()
        } else {
            FavoriteDB.share.save(movie: movie)
            completion()
        }
    }

}
