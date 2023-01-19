//
//  MoviesViewController.swift
//  MovieViper
//
//  Created by hossein on 9/28/1401 AP.
//

import UIKit

protocol MoviesViewControllerInterface {
    func loadMovies(movies: Movies)
    func loadFailed(withError: String)
}

final class MoviesViewController: UIViewController {
    
    var presenter: MoviesPresenterInterface?
    private let listView: ListView = ListView()
    private let notificationCenter = NotificationCenter.default
    fileprivate let titleVC = "Movies"


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        LoadingIndicatorView.show("Loading")
        presenter?.viewDidAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = listView
        self.title = titleVC
    }

}

extension MoviesViewController: MoviesViewControllerInterface {
    func loadFailed(withError: String) {
        DispatchQueue.main.async {
        LoadingIndicatorView.hide()
        self.showAlert(message: withError, title: "Error")
        }
    }
    
    func loadMovies(movies: Movies) {
        self.listView.movieArray = movies.results
        DispatchQueue.main.async {
            LoadingIndicatorView.hide()
            self.listView.tableView.reloadData()
        }
    }
    
}
