//
//  ArticleDetailsView.swift
//  NYTrendingArticles
//
//  Created by miad yazeed on 19/05/2024.
//

import Foundation
import SwiftUI

struct ArticleDetailsView: View {
    
    let article: Article
    
    var body: some View {
        VStack {
            
            Image(uiImage: article.largeImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(article.title)
            
            Text(article.abstract)
                .font(.caption)
                .frame(alignment: .leading)
                .foregroundStyle(Color.secondary)
            
            HStack(alignment: .bottom) {
                Image(systemName: "pencil.and.scribble")
                Text(article.byline)
                    .font(.caption2)
                    .foregroundStyle(Color.gray)
                    .padding(.top)
            }
        }
        
    }
}
