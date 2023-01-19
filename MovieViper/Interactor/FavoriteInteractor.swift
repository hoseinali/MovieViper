//
//  FavoriteInteractor.swift
//  MovieViper
//
//  Created by hossein on 9/30/1401 AP.
//

import Foundation

protocol FavoriteInteractorInterface {
    func fetchMovies()
}
protocol FavoriteListInteractorOutputProtocol: AnyObject {
    func moviesFetchedSuccessfully(movies: [Result])
}

final class FavoriteInteractor {
    weak var output: FavoriteListInteractorOutputProtocol?
}

extension FavoriteInteractor: FavoriteInteractorInterface {
    func fetchMovies() {
        let movies = FavoriteDB.share.list()
        output?.moviesFetchedSuccessfully(movies: movies)
    }
}
