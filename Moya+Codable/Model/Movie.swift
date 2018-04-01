//
//  Movie.swift
//  Moya+Codable
//
//  Created by QY on 2018/3/31.
//  Copyright © 2018年 QY. All rights reserved.
//

import Foundation

struct Movie: Codable {

    var rating: Rating
    var images: Images
    
    var reviews_count: Int
    var wish_count: Int
    var year: String
    var summary: String
    var comments_count: Int
    var ratings_count: Int
    var collect_count: Int
    
    var countries: [String]
    var genres: [String]
    var aka: [String]
    
    var casts: [Person]
    var directors: [Person]
}

struct Rating: Codable {
    
    var max: Float
    var min: Float
    var average: Float
    var stars: String
}

struct Images: Codable {
    
    var small: String
    var large: String
    var medium: String
}

struct Person: Codable {
   
    var alt: String
    var name: String
    var id: String
    
    var avatars: Images
}
