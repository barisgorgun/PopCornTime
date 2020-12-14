//
//  TvShowsDetailsViewController.swift
//  PopCornTime
//
//  Created by MacBook on 3.12.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit

class TvShowsDetailsViewController: BaseScreen {
    
    @IBOutlet weak var clvCast: UICollectionView!
    @IBOutlet weak var lblVoteAvarage: UILabel!
    @IBOutlet weak var lblTvShowName: UILabel!
    @IBOutlet weak var imgTvShow: UIImageView!
    @IBOutlet weak var lblTvShowAirDate: UILabel!
    @IBOutlet weak var lblTvShowRunTime: UILabel!
    @IBOutlet weak var lblTvShowGenre: UILabel!
    var response : TvDetailsResponseModel?
    var castResponse : CastResponseModel?
    
    
    @IBOutlet weak var txvTvShowOverview: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        RequestFile.init().getTvDetails(id: BaseData.sharedInstance.selectedId ?? 0) { (responseModel) in
            self.response = responseModel
            self.lblTvShowName.text = self.response?.name
            self.lblTvShowRunTime.text = "\(self.response?.episodeRunTime ?? [])min"
            self.lblVoteAvarage.text = "\(self.response?.voteAverage ?? 0.0)"
            self.txvTvShowOverview.text = self.response?.overview
            let filmImageUrlStr = self.response?.posterPath ?? ""
            let url = URL(string: "https://image.tmdb.org/t/p/original" + filmImageUrlStr)
            self.imgTvShow?.kf.setImage(with: url)
            var airDate = String(self.response?.firstAirDate ?? "").prefix(4)
            var lastAirDate = String(self.response?.lastAirDate ?? "").prefix(4)
            self.lblTvShowAirDate.text = "TV Series (\(airDate)" + " - " + "\(lastAirDate))"
            
        }
        
       RequestFile.init().getCastList(id: BaseData.sharedInstance.selectedId ?? 0) { (responseModel) in
        self.castResponse = responseModel
        self.clvCast.reloadData()
       // print(self.castResponse?.cast?[2].name)
     
        }
       
    }
    
}

extension TvShowsDetailsViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.castResponse?.cast?.count ?? 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CastCell", for: indexPath) as! CastCell
        cell.lblCastName.text = self.castResponse?.cast?[indexPath.row].name ?? "Deneme"
        let castImageUrlStr = self.castResponse?.cast?[indexPath.row].profilePath ?? ""
        let url = URL(string: "https://image.tmdb.org/t/p/original" + castImageUrlStr)
        cell.imgCast.kf.setImage(with: url)
        
        return cell
        
    }
    
    
}
