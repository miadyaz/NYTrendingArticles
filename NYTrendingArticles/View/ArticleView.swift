//
//  ArticleView.swift
//  NYTrendingArticles
//
//  Created by miad yazeed on 19/05/2024.
//

import Foundation
import SwiftUI

struct ArticleView: View {
    let article: Article
    var body: some View {
        
        VStack {
            HStack {
                Image(uiImage: article.image ?? UIImage())
                    .clipShape(Circle())
                    .scaledToFill()
                    .frame(width: 100, height: 100, alignment: .top)
                Text(article.title)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
            }
            Text(article.abstract)
                .font(.caption)
                .frame(alignment: .leading)
                .foregroundStyle(Color.secondary)
            HStack(alignment: .bottom) {
                Spacer()
                Image(systemName: "calendar")
                Text(article.publishedDate)
                    .font(.caption2)
                    .foregroundStyle(Color.gray)
                    .padding(.top)
            }
        }
        .padding()
        
        Divider()
            .padding()
    }
}
