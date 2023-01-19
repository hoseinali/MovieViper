//
//  FavoritePresenter.swift
//  MovieViper
//
//  Created by hossein on 9/30/1401 AP.
//

import Foundation

protocol FavoritePresenterInterface {
    func viewDidAppear()
}

final class FavoritePresenter {
    var view: FavoriteViewControllerInterface
    let interactor: FavoriteInteractorInterface?

    init(interactor: FavoriteInteractorInterface, view: FavoriteViewControllerInterface) {
        self.view = view
        self.interactor = interactor
    }
}

extension FavoritePresenter: FavoritePresenterInterface {
    
    func viewDidAppear() {
        DispatchQueue.main.async {
            self.interactor?.fetchMovies()
        }
    }
}

extension FavoritePresenter: FavoriteListInteractorOutputProtocol {
    func moviesFetchedSuccessfully(movies: [Result]) {
        view.loadMovies(movies: movies)
    }

}
