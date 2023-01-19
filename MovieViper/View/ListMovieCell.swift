//
//  ListMovieCell.swift
//  MovieViper
//
//  Created by hossein on 9/28/1401 AP.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    private let cellId = "cellId"
    private var isFavorite: Bool = false
    var handleFavorite: ((_ favorite: Bool) -> Void)?

    var movieID = [Int]()
    lazy var movieImage : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 8
        iv.layer.masksToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    lazy var titelLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byClipping
        label.textColor = Constants.Colors.mainTextColor
        label.font = Constants.Fonts.titelFont
        return label
    }()
    
    lazy var shortDescriptionLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 4
        label.lineBreakMode = .byClipping
        label.textColor = Constants.Colors.descriptionTextColor
        label.font = Constants.Fonts.descriptionFont
        return label
    }()
    
    lazy var dateLabel:UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.descriptionTextColor
        label.font = Constants.Fonts.dateFont
        return label
    }()
    
    var favoritesButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "favorite_default"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    func configure(movieItem: Result){
        self.titelLabel.text = movieItem.title
        shortDescriptionLabel.text = movieItem.overview
        dateLabel.text = movieItem.releaseDate
        movieID.append(movieItem.id)
        guard let resource = URL(string: Constants.BaseURL.imageBaseURL + (movieItem.backdropPath ?? movieItem.posterPath)) else {return}
        let placeholder = UIImage(named: "header")
        isFavorite = FavoriteDB.share.checkIsFavorite(id: movieItem.id)
        let imgName = isFavorite ? "favorite_selected" : "favorite_default"
        let favoriteButtonImage = UIImage(named: imgName)
        self.favoritesButton.setImage(favoriteButtonImage, for: .normal)
        self.movieImage.kf.setImage(with: resource, placeholder: placeholder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: cellId)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MovieCell : SetupView {
    func buildViewHierarchy() {
        self.contentView.addSubviews(movieImage, shortDescriptionLabel, dateLabel, favoritesButton, titelLabel)
    }
    
    func setupConstraints() {
        movieImage.anchor(top: self.topAnchor, leading: self.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 15, left: 20, bottom: 0, right: 0), size: .init(width: 100, height: 100))
        titelLabel.anchor(top: self.topAnchor, leading: movieImage.trailingAnchor, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 15, left: 10, bottom: 0, right: 50))
        shortDescriptionLabel.anchor(top: titelLabel.bottomAnchor, leading: movieImage.trailingAnchor, bottom: movieImage.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 15, right: 50))
        dateLabel.anchor(top: nil, leading: nil, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 10, right: 20))
        favoritesButton.anchor(top: self.topAnchor, leading: nil, bottom: nil, trailing: self.trailingAnchor, padding: .init(top: 15, left: 0, bottom: 0, right: 20), size: .init(width: 24, height: 24))
    }
    
    func setupAdditionalConfiguration() {
        favoritesButton.addTarget(self, action: #selector(markFavorite), for: .touchUpInside)
    }
    @objc func markFavorite() {
        setFavoriteButtonImage()
    }
    
    func setFavoriteButtonImage() {
        handleFavorite?(isFavorite)
    }
}
