//
//  ArticleViewModel.swift
//  NYTrendingArticles
//
//  Created by miad yazeed on 18/05/2024.
//

import Foundation
import SwiftUI

class ArticleViewModel: ObservableObject {
    
    var network = NetworkClient()
    @Published var articles: [Article] = []
    
    init () {}
    
    func didSelectPeriod(period: Period) async {
            let arts = await network.fetchArticles(period: period)
            DispatchQueue.main.async {
                self.articles = arts
            }
    }
}
