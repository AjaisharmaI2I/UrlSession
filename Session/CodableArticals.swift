//
//  CodableArticals.swift
//  Session
//
//  Created by Ideas2IT on 20/07/23.
//

import Foundation

class CodableArticals : Codable {
    var articles: [Article]
}

class Article: Codable {
    var author: String?
    var title: String?
    var content: String?
    var description: String?
    var publishedAt: String?
    var url: String?
    var urlToImage: String?
    var source: Source?
}

class Source: Codable {
    var id : String?
    var name : String?
}
