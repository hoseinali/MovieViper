//
//  FavoriteRouter.swift
//  MovieViper
//
//  Created by hossein on 9/30/1401 AP.
//

import UIKit



final class FavoriteRouter: NSObject {

    var presenter: FavoritePresenterInterface?
    private weak var viewController: FavoriteViewController?
    
    static func setupModule() -> FavoriteViewController {
        let vc = FavoriteViewController()
        let interactor = FavoriteInteractor()
        let router = FavoriteRouter()
        let presenter = FavoritePresenter(interactor: interactor, view: vc)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}
