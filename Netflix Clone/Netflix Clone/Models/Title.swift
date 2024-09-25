//
//  Movie.swift
//  Netflix Clone
//
//  Created by constantine Walker on 13.09.24.
//

import Foundation

struct TrendingTitleResponse: Decodable {
    let results: [Title]
}
struct Title: Decodable {
    let id: Int
    let media_type: String?
    let original_name: String?
    let original_title: String?
    let poster_path: String?
    let overview: String?
    let vote_count: Int
    let release_date: String?
    let vote_average: Double
}
