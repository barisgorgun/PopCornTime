//
//  FavoritesViewController.swift
//  PopCornTime
//
//  Created by MacBook on 9.01.2021.
//  Copyright © 2021 Baris Gorgun. All rights reserved.
//

import UIKit

class FavoritesViewController: BaseScreen {

    @IBOutlet weak var tbvFavoritesList: UITableView!
    var favoritesList : [Result]?
    var filterList : [Result]?
    
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()

        favoritesList = BaseData.sharedInstance.getFavoriteList()
        tbvFavoritesList.reloadData()
        
        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(favoriteListChange), name: Notification.Name("ChangeFavoriteList"), object: nil)
        // Do any additional setup after loading the view.
    }
    
    @objc func favoriteListChange()  {
        favoritesList = BaseData.sharedInstance.getFavoriteList()
        tbvFavoritesList.reloadData()
    }

}

extension FavoritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesCell", for: indexPath) as! FavoritesCell
        if let movies = favoritesList?[indexPath.row] {
            cell.setViewData(Results: movies)
        }
        
        
        return cell
    }

}

extension FavoritesViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
       
    }
}
