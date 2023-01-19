//
//  ListInteractor.swift
//  MovieViper
//
//  Created by hossein on 9/28/1401 AP.
//

import Foundation

protocol MoviesInteractorInterface {
    func fetchMovies()
}

protocol MovieListInteractorOutputProtocol: AnyObject {
    func moviesFetchedSuccessfully(movies: Movies)
    func moviesFetchingFailed(withError error: Error)
}

final class ListInteractor {
    weak var output: MovieListInteractorOutputProtocol?
}

extension ListInteractor: MoviesInteractorInterface {
    func fetchMovies() {
        Worker.shared.getMovies { [weak self] result in
            guard self != nil else { return }
            switch result {
            case .success(let movies):
                self?.output?.moviesFetchedSuccessfully(movies: movies)
            case .failure(let error):
                debugPrint("movies",error)
                self?.output?.moviesFetchingFailed(withError: error)
            }
        }
    }
}
