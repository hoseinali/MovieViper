//
//  ListPresenter.swift
//  MovieViper
//
//  Created by hossein on 9/28/1401 AP.
//

import Foundation

protocol MoviesPresenterInterface {
    func viewDidAppear()
}

final class ListPresenter {
    var view: MoviesViewControllerInterface
    let interactor: MoviesInteractorInterface?

    init(interactor: MoviesInteractorInterface, view: MoviesViewControllerInterface) {
        self.view = view
        self.interactor = interactor
    }
}

extension ListPresenter: MoviesPresenterInterface {
    
    func viewDidAppear() {
        DispatchQueue.main.async {
            self.interactor?.fetchMovies()
        }
    }
}

extension ListPresenter: MovieListInteractorOutputProtocol {
    
    func moviesFetchedSuccessfully(movies: Movies) {
        view.loadMovies(movies: movies)
    }
    
    func moviesFetchingFailed(withError error: Error) {
        view.loadFailed(withError: error.localizedDescription)
    }
}
