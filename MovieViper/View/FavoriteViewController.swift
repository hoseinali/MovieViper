//
//  FavoriteViewController.swift
//  MovieViper
//
//  Created by hossein on 9/30/1401 AP.
//

import UIKit

protocol FavoriteViewControllerInterface {
    func loadMovies(movies: [Result])
}

final class FavoriteViewController: UIViewController {
    
    var presenter: FavoritePresenterInterface?
    private let listView: ListView = ListView()
    private let notificationCenter = NotificationCenter.default
    fileprivate let titleVC = "Favorite"
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        presenter?.viewDidAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = listView
        self.title = titleVC
    }
    
}

extension FavoriteViewController: FavoriteViewControllerInterface {
    
    func loadMovies(movies: [Result]) {
        self.listView.movieArray = movies
        
        DispatchQueue.main.async {
            if movies.isEmpty {
                self.showAlert(message: "No favorite movies", title: "Alert")
            }
            self.listView.tableView.reloadData()
        }
    }
    
}
