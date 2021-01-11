//
//  BaseData.swift
//  PopCornTime
//
//  Created by MacBook on 3.12.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import Foundation

class BaseData {
    static let sharedInstance = BaseData.init()
    private init() {
        
    }
    
     var selectedId: Int?
    
    private var favoriteList :[Result] = [Result]()
   
   
    func  getFavoriteList() -> [Result] {
        return favoriteList
    }
    
    func addFavoriteMovie(movie:Result)  {
        if(!isMovieFavorite(movieId: movie.id!)){
            favoriteList.append(movie)
        }
   
    }
    
    func isMovieFavorite(movieId:Int) -> Bool {
        for movie in favoriteList {
            if(movie.id == movieId){
                return true
            }
        }
        return false
    }
    
    func removeFavoriteMovie(movie:Result) {
        var removeIndex = -1
        for (index,item) in favoriteList.enumerated(){
            if(item.id == movie.id){
                removeIndex = index
            }
        }
        
        if(removeIndex != -1){
            favoriteList.remove(at: removeIndex)
        }
    }
    
}
