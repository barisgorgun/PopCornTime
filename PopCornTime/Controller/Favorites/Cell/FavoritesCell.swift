//
//  FavoritesCell.swift
//  PopCornTime
//
//  Created by MacBook on 9.01.2021.
//  Copyright © 2021 Baris Gorgun. All rights reserved.
//

import UIKit

class FavoritesCell: UITableViewCell {

    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var lblvoteAverage: UILabel!
    @IBOutlet weak var lblFavoriteMoviesGenre: UILabel!
    @IBOutlet weak var lblFavoriteReleaseDate: UILabel!
    @IBOutlet weak var lblFavoriteName: UILabel!
    @IBOutlet weak var imgFavorite: UIImageView!
    var movie : Result?
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setViewData(Results:Result){
        self.movie = Results
        lblFavoriteReleaseDate.text = "\(Results.releaseDate ?? "")"
        let movieName = Results.title
        if (movieName != nil) {
            lblFavoriteName.text = movieName
        }else{
            lblFavoriteName.text = Results.name
        }
        lblvoteAverage.text = "\(Results.voteAverage ?? 0.0)"
        let filmImageUrlStr = Results.backdropPath ?? ""
        let url = URL(string: "https://image.tmdb.org/t/p/original" + filmImageUrlStr)
        imgFavorite?.kf.setImage(with: url)
        
    }
    
    @IBAction func onClickFavoriteButton(_ sender: Any) {
        BaseData.sharedInstance.removeFavoriteMovie(movie: movie!)
        let nc = NotificationCenter.default
        nc.post(name:Notification.Name("ChangeFavoriteList"),object: nil)
        
    }
    
}
