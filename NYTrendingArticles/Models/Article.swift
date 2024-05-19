////
////  Article.swift
////  NYTrendingArticles
////
////  Created by miad yazeed on 18/05/2024.
////

import Foundation
import UIKit

enum Period: Int, CaseIterable {
    case day = 1
    case week = 7
    case month = 30
    
    func stringValue() -> String {
        switch self {
        case .day:
            return "Day"
        case .week:
            return "Week"
        case .month:
            return "Month"
        }
    }
}

struct Article: Identifiable {
    let id = UUID()
    let title: String
    let abstract: String
    let byline: String
    let publishedDate: String
    let image: UIImage?
    let largeImage: UIImage
}

import Foundation

// MARK: - Response
struct Response: Codable {
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let publishedDate: String
    let title, abstract, byline: String
    let media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case publishedDate = "published_date"
        case title, abstract, byline
        case media
    }
}

// MARK: - Media
struct Media: Codable {
    let mediaMetadata: [MediaMetadata]
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

// MARK: - MediaMetadata
struct MediaMetadata: Codable {
    let url: String
}
