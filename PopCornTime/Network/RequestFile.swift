//
//  RequestFile.swift
//  PopCornTime
//
//  Created by MacBook on 22.11.2020.
//  Copyright © 2020 Baris Gorgun. All rights reserved.
//

import Foundation
import Alamofire

class RequestFile {
    
    let baseURL = "https://api.themoviedb.org/3/"
    let apiKey = "ade094db1689805d5b0787ea9bd740d7"
    
    

  func getMovieList( successHandler: @escaping( TvResponseModel?)->()){
         AF.request(baseURL + "movie/top_rated?api_key=" + apiKey + "&language=en-US&page=1").responseDecodable { (response:AFDataResponse<TvResponseModel>) in
             switch(response.result){
             case .success(let responseData):
                 successHandler(responseData)
                 break
             case .failure(let error):
                 print(error.localizedDescription)
                 break
             }
             
         }
     }
    func getMovieDetails(id:Int, successHandler: @escaping( MovieDetailsResponse?)->()){
       AF.request(baseURL + "movie/" + String(id) + "?api_key=" + apiKey + "&language=en-US").responseDecodable { (response:AFDataResponse<MovieDetailsResponse>) in
           switch(response.result){
           case .success(let responseData):
               successHandler(responseData)
               //print(responseData)
               break
           case .failure(let error):
               print(error.localizedDescription)
               break
           }
           
       }
   }
    func getTvList( successHandler: @escaping( TvResponseModel?)->()){
    
            AF.request(baseURL + "tv/popular?api_key=" + apiKey + "&language=en-US").responseDecodable { (response:AFDataResponse<TvResponseModel>) in
                switch(response.result){
                case .success(let responseData):
                    successHandler(responseData)
                   //print(responseData)
                    break
                case .failure(let error):
                   print(error.localizedDescription)
                    break
                }
                
            }
        }
    
     func getTvDetails(id:Int, successHandler: @escaping( TvDetailsResponseModel?)->()){
        AF.request(baseURL + "tv/" + String(id) + "?api_key=" + apiKey).responseDecodable { (response:AFDataResponse<TvDetailsResponseModel>) in
            switch(response.result){
            case .success(let responseData):
                successHandler(responseData)
                //print(responseData)
                break
            case .failure(let error):
                print(error.localizedDescription)
                break
            }
            
        }
    }
    
    func getCastList(id:Int, successHandler: @escaping( CastResponseModel?)->()){
           AF.request( baseURL + "tv/" + String(id) + "/credits?api_key=" + apiKey).responseDecodable { (response:AFDataResponse<CastResponseModel>) in
               switch(response.result){
               case .success(let responseData):
                   successHandler(responseData)
                   //print(responseData)
                   break
               case .failure(let error):
                   print(error.localizedDescription)
                   break
               }
               
           }
       }
    
    func getGenreNames(successHandler: @escaping( GenreResponseModel?)->()){
        
       AF.request(baseURL + "genre/movie/list?api_key=" + apiKey ).responseDecodable { (response:AFDataResponse<GenreResponseModel>) in
           switch(response.result){
           case .success(let responseData):
               successHandler(responseData)
               //print(responseData)
               break
           case .failure(let error):
               print(error.localizedDescription)
               break
           }
           
       }
   }
    
  
    
}


 
