//
//  Constants.swift
//  MovieViper
//
//  Created by hossein on 9/28/1401 AP.
//
import UIKit

struct Constants {
    
    struct Fonts {
        static let defaultFont: UIFont = UIFont.systemFont(ofSize: 17, weight: .regular)
        static let titelFont: UIFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        static let descriptionFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .regular)
        static let dateFont: UIFont = UIFont.systemFont(ofSize: 12, weight: .thin)
    }
    
    struct Sizes {
        static let tableViewCellHeight: CGFloat = 150
    }
    
    struct Colors {
        static let mainTextColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        static let descriptionTextColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        static let backItemColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    struct BaseURL {
        static let baseURL: String = "https://api.themoviedb.org/4/"
        static let noImage : String = ""
        static let imageBaseURL : String = "https://image.tmdb.org/t/p/w500/"
        static let apiKey : String = "31f3069c53ec87977e84630c37dc417d"
        static let moviesURL: String = "\(baseURL)list/1?api_key=" + apiKey + "&sort_by=vote_average.asc"
    }

}
