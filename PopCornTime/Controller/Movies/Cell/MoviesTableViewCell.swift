//
//  MoviesTableViewCell.swift
//  PopCornTime
//
//  Created by MacBook on 22.11.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var btnFavorite: UIButton!
    
    @IBOutlet weak var lblReleaseDate: UILabel!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblGenresName: UILabel!
    @IBOutlet weak var imgMovie: CustomImageView!
    @IBOutlet weak var lblVoteAverage: UILabel!
    var movie : Result?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setViewData(results : Result) {
        self.movie = results
        lblMovieName.text = results.title
        lblReleaseDate.text = results.releaseDate
        lblVoteAverage.text = "\(results.voteAverage ?? 0.0)"
        let filmImageUrlStr = results.posterPath ?? ""
        let url = URL(string: "https://image.tmdb.org/t/p/original" + filmImageUrlStr)
        imgMovie?.kf.setImage(with: url)
        
      
    }
 
    @IBAction func addFavorites(_ sender: Any) {
       
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
