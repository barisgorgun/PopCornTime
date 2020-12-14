//
//  ViewController.swift
//  PopCornTime
//
//  Created by MacBook on 22.11.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import FSPagerView


class ViewController: BaseScreen {

    @IBOutlet weak var lblPagerMovieName: UILabel!
    @IBOutlet weak var lblPagerVoteAverage: UILabel!
    @IBOutlet weak var lblPagerGenreMovie: UILabel!
    @IBOutlet weak var pagerView: FSPagerView! {
        didSet {
            self.pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
            self.pagerView.itemSize = FSPagerView.automaticSize
        }
    }
    
    @IBOutlet weak var tbvMovieList: UITableView!
    var movieList : MovieResponseModel?
    var genreNames: Dictionary<Int,String> = [:]
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
     
   
        
        RequestFile.init().getMovieList { (responseData) in
                        self.movieList = responseData
                        self.tbvMovieList.reloadData()
                        self.pagerView.reloadData()
                    }
        
        
        RequestFile.init().getGenreNames { (responseData) in
            if let responseModel = responseData {
                for genre in responseModel.genres{
                    self.genreNames[genre.id ?? 0] = genre.name
                }
            }
        }
        
        
           pagerView.dataSource = self
           pagerView.delegate = self
           pagerView.transformer = FSPagerViewTransformer(type: .linear)
    }

    
    public func getGenres(genreIds:[Int]) -> String {
        var kategori = ""
        for genre in genreIds where genreNames[genre] != nil{
            if kategori.count == 0 {
                kategori = (genreNames[genre] ?? "")
            }else {
                kategori += ", " + (genreNames[genre] ?? "")
            }
        }
        return kategori
    }
    
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieList?.results.count ?? 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell") as! MoviesTableViewCell
        
        
        if let movie = movieList?.results[indexPath.row] {
            cell.setViewData(results: movie)
        }
        let genresId = movieList?.results[indexPath.row].genreIDS
        cell.lblGenresName.text = getGenres(genreIds: genresId ?? [0])
    
        return cell
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        BaseData.sharedInstance.selectedId = self.movieList?.results[indexPath.row].id
        performSegue(withIdentifier: "showMovieDetails", sender: nil)
        
    }
    
}


extension ViewController: FSPagerViewDelegate,FSPagerViewDataSource {
    
    public func numberOfItems(in pagerView: FSPagerView) -> Int {
        return self.movieList?.results.count ?? 0
    }
        
    public func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        let filmImageUrlStr = self.movieList?.results[index].backdropPath ?? ""
        let url = URL(string: "https://image.tmdb.org/t/p/original" + filmImageUrlStr)
        cell.imageView?.kf.setImage(with: url)
        lblPagerMovieName.text = self.movieList?.results[index].title
        lblPagerVoteAverage.text = "\(self.movieList?.results[index].voteAverage ?? 0)"
        let pagerGenre = self.movieList?.results[index].genreIDS
        lblPagerGenreMovie.text = getGenres(genreIds: pagerGenre ?? [])
        return cell
    }
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
         BaseData.sharedInstance.selectedId = self.movieList?.results[index].id
               performSegue(withIdentifier: "showMovieDetails", sender: nil)
    }
}


