//
//  MovieDetailsViewController.swift
//  PopCornTime
//
//  Created by MacBook on 29.11.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: BaseScreen {

    
    var response : MovieDetailsResponse?
   
    
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var lblRunTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblMovieGenre: UILabel!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var txvOverview: UITextView!
    @IBOutlet weak var lblVoteAverage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
   
        
        RequestFile.init().getMovieDetails(id: BaseData.sharedInstance.selectedId ?? 0) { (responseModel) in
       
        self.response = responseModel
        self.lblMovieName.text = self.response?.title
        var filmImage = self.response?.posterPath ?? ""
        let url = URL(string: "https://image.tmdb.org/t/p/original" + filmImage)
        self.imgMovie?.kf.setImage(with: url)
        self.lblRunTime.text = "\(self.response?.runtime ?? 0)min"
        self.lblDate.text = self.response?.releaseDate
        self.txvOverview.text = self.response?.overview
        var voteAverage = self.response?.voteAverage ?? 0.0
        self.lblVoteAverage.text = "\(voteAverage) "
       
          
       }

        
    }

}
