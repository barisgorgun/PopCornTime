//
//  TvShowsViewController.swift
//  PopCornTime
//
//  Created by MacBook on 1.12.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit
import FSPagerView

class TvShowsViewController: BaseScreen {

    @IBOutlet weak var colvTvList: UICollectionView!
    
    var TvList : TvResponseModel?
   
    @IBOutlet weak var lblNamePager: UILabel!
    @IBOutlet weak var lblVoteAveragePager: UILabel!
    @IBOutlet weak var lblGenrePager: UILabel!
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        RequestFile.init().getTvList { (responseData) in
                              self.TvList = responseData
                              self.colvTvList.reloadData()
                              self.pagerView.reloadData()
            self.pagerView.transformer = FSPagerViewTransformer(type: .linear)
                          }
        // Do any additional setup after loading the view.
    }
    
    
   // pagerView.transformer = FSPagerViewTransformer(type: .linear)//
    
}

extension TvShowsViewController: UICollectionViewDelegate,UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: (colvTvList.frame.width) / 2, height: 290)
      }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.TvList?.results.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TvShowsCollectionViewCell", for: indexPath) as! TvShowsCollectionViewCell
       
        
        cell.lblTvShowsName.text = self.TvList?.results[indexPath.row].name
        cell.lblVoteAverage.text = "\(self.TvList?.results[indexPath.row].voteAverage ?? 0.0)"
        let filmImageUrlStr = self.TvList?.results[indexPath.row].backdropPath ?? ""
        let url = URL(string: "https://image.tmdb.org/t/p/original" + filmImageUrlStr)
        cell.imgTvShowsImage?.kf.setImage(with: url)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        BaseData.sharedInstance.selectedId = self.TvList?.results[indexPath.row].id
        performSegue(withIdentifier: "showTvDetails", sender: nil)
        
    }
   
    
}


extension TvShowsViewController: FSPagerViewDelegate,FSPagerViewDataSource {
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.TvList?.results.count ?? 0
    }
        
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let filmImageUrlStr = self.TvList?.results[index].backdropPath ?? ""
        let url = URL(string: "https://image.tmdb.org/t/p/original" + filmImageUrlStr)
        cell.imageView?.kf.setImage(with: url)
        lblNamePager.text = self.TvList?.results[index].name ?? ""
        lblVoteAveragePager.text = "\(self.TvList?.results[index].voteAverage ?? 0.0)"
        
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
         BaseData.sharedInstance.selectedId = self.TvList?.results[index].id
             //  performSegue(withIdentifier: "showMovieDetails", sender: nil)
    }
}


