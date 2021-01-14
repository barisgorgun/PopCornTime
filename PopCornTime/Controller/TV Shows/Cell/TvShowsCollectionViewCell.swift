//
//  TvShowsCollectionViewCell.swift
//  PopCornTime
//
//  Created by MacBook on 1.12.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit


class TvShowsCollectionViewCell: UICollectionViewCell {
 
   
    @IBOutlet weak var btnFavorite: UIButton!
    @IBOutlet weak var lblVoteAverage: UILabel!
    @IBOutlet weak var lblTvShowsName: UILabel!
    @IBOutlet weak var imgTvShowsImage: UIImageView!
    
    var movie : Result?
    
 
    
    func setViewData(Results:Result){
        self.movie = Results
        lblVoteAverage.text = "\(Results.voteAverage ?? 0)"
        lblTvShowsName.text = Results.name
        let filmImageUrlStr = Results.backdropPath ?? ""
        let url = URL(string: "https://image.tmdb.org/t/p/original" + filmImageUrlStr)
        imgTvShowsImage?.kf.setImage(with: url)
        
    }
    
    @IBAction func addFavorite(_ sender: Any) {
        let nc = NotificationCenter.default
        if (!BaseData.sharedInstance.isMovieFavorite(movieId: movie!.id!)) {
            BaseData.sharedInstance.addFavoriteMovie(movie: movie!)
            self.btnFavorite.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
            
        } else {
            self.btnFavorite.setImage(UIImage.init(systemName: "heart"), for: .normal)
            BaseData.sharedInstance.removeFavoriteMovie(movie: movie!)
            
        }
        nc.post(name:Notification.Name("ChangeFavoriteList"),object: nil)
    }
}
