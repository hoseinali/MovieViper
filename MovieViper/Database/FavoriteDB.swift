//
//  FavoriteDB.swift
//  MovieViper
//
//  Created by hossein on 9/30/1401 AP.
//

import Foundation
import RealmSwift

class FavoriteDB {
    static let share = FavoriteDB()
    private let realm = try! Realm()
    
    func save(movie: Result) {
        let object = FavoriteObject()
        object.favorite = true
        object.id = movie.id
        object.title = movie.title
        object.posterPath = movie.posterPath
        object.backdropPath = movie.backdropPath
        object.voteAverage = movie.voteAverage
        object.overview = movie.overview
        object.releaseDate = movie.releaseDate
        object.video = movie.video
        
        try! realm.write {
            realm.add(object, update: .all)
        }
    }
    
    func list() -> [Result] {
        let movies = load().map {
            Result(
                video: $0.video,
                posterPath: $0.posterPath,
                id: $0.id,
                backdropPath: $0.backdropPath,
                title: $0.title,
                voteAverage: $0.voteAverage,
                overview: $0.overview,
                releaseDate: $0.releaseDate
            )
        }
        return movies
    }
    
    func checkIsFavorite(id: Int) -> Bool {
        let filter = "(id = \(id))"
        let movie = load(filter: filter)
        if movie.count == 1 {
            return true
        }
        return false
    }
    
    func remove(id: Int) {
        let filter = "(id = \(id))"
        guard let movie = load(filter: filter).first else { return }
        try! realm.write {
            realm.delete(movie)
        }
    }
    
    private func load(filter: String? = nil) -> [FavoriteObject] {
        if let filter = filter, !filter.isEmpty {
            let results = Array(realm.objects(FavoriteObject.self).filter(filter)) as [FavoriteObject]
            return results
        }
        
        let results = Array(realm.objects(FavoriteObject.self)) as [FavoriteObject]
        return results
    }
}

class FavoriteObject: Object {
    @objc dynamic var favorite: Bool = false
    @objc dynamic var id: Int = 0
    @objc dynamic var title: String = ""
    @objc dynamic var posterPath: String = ""
    @objc dynamic var backdropPath: String? = ""
    @objc dynamic var video: Bool = false
    @objc dynamic var voteAverage: Double = 0.0
    @objc dynamic var overview: String = ""
    @objc dynamic var releaseDate: String = ""
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

