//
//  NetworkClient.swift
//  NYTrendingArticles
//
//  Created by miad yazeed on 18/05/2024.
//

import Foundation
import SwiftUI

struct NetworkClient {
    
    init (){}
    
    func fetchArticles(period: Period) async -> [Article] {
        guard let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/viewed/\(period.rawValue).json?api-key=9A7eItHWtbK4J6xyMX3QU2zAA5KKbqjZ") else { return []}
        do {
            let (data, _) = try await URLSession.shared.data(for:URLRequest(url: url))
            let results = try JSONDecoder().decode(Response.self, from: data)
            var articles: [Article] = []
            print(results)
            for result in results.results {
                let imageUrl = result.media.first?.mediaMetadata.first?.url
                let largeImage = result.media.first?.mediaMetadata.last?.url
                let article = Article(title: result.title,
                                      abstract: result.abstract,
                                      byline: result.byline, publishedDate: result.publishedDate,
                                      image: try await fetchImage(with: imageUrl),
                                      largeImage: try await fetchImage(with: largeImage ?? imageUrl) ?? UIImage())
                
                articles.append(article)
            }
            
            return articles
        }catch{
            print(error)
            return []
        }
        
    }
    
    func fetchImage(with url: String?) async throws -> UIImage? {
        guard let url = URL(string: url ?? "") else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return UIImage(data: data)
        } catch {
            print("Error fetching image: \(error)")
            return nil
        }
    }
}
