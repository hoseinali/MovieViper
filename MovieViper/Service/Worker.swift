//
//  Worker.swift
//  MovieViper
//
//  Created by hossein on 9/28/1401 AP.
//

import Foundation

class Worker {
    
    static let shared: Worker = {
        let instance = Worker()
        return instance
    }()

    func getMovies(completionHandler: @escaping (Results<Movies>) -> ()) {
        NetworkManager.shared.request(Router.movies, decodeToType: Movies.self, completionHandler: completionHandler)
    }
}
