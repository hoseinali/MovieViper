//
//  ListRouter.swift
//  MovieViper
//
//  Created by hossein on 9/29/1401 AP.
//

import UIKit



final class ListRouter: NSObject {

    var presenter: MoviesPresenterInterface?
    private weak var viewController: MoviesViewController?
    
    static func setupModule() -> MoviesViewController {
        let vc = MoviesViewController()
        let interactor = ListInteractor()
        let router = ListRouter()
        let presenter = ListPresenter(interactor: interactor, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}
