//
//  ListView.swift
//  MovieViper
//
//  Created by hossein on 9/29/1401 AP.
//

import UIKit

class ListView: UIView {
    
    var movieArray = [Result]()
    fileprivate let cellId = "cellId"
    
    //MARK: - UI Elements
    lazy var tableView : UITableView = {
        let tableView = UITableView(frame: self.frame)
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")}
    
}

extension ListView : SetupView, UISearchBarDelegate, UISearchDisplayDelegate {
    func buildViewHierarchy() {
        self.addSubviews(tableView)
    }
    
    func setupConstraints() {
        tableView.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: cellId)
    }
    
}

extension ListView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  movieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MovieCell ?? MovieCell(style: .default, reuseIdentifier: cellId)
        cell.configure(movieItem: movieArray[indexPath.row])
        cell.handleFavorite = { [weak self] favorite in
            guard let movie = self?.movieArray[indexPath.item] else { return }
            Helper.updateFavorite(movie: movie, favorite: favorite) {
                tableView.performBatchUpdates({
                    guard let movie = self?.movieArray[indexPath.item] else { return }
                    cell.configure(movieItem: movie)
                })
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Sizes.tableViewCellHeight
    }
    
    
    
}
