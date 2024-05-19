//
//  ContentView.swift
//  NYTrendingArticles
//
//  Created by miad yazeed on 18/05/2024.
//

import SwiftUI

struct ArcticlesScreen: View {
    
    @ObservedObject var viewModel = ArticleViewModel()
    @State var seletedPeriod: Period = Period(rawValue: 1)!
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                Picker("Test", selection: $seletedPeriod) {
                    ForEach(Period.allCases, id: \.self ) {
                        Text($0.stringValue())
                    }
                }
                .padding()
                .pickerStyle(.segmented)
                .onChange(of: seletedPeriod) {
                    Task {
                        await viewModel.didSelectPeriod(period: seletedPeriod)
                    }
                }
                ForEach(viewModel.articles, id: \.id) { article in
                    NavigationLink {
                        ArticleDetailsView(article: article)
                    } label: {
                        ArticleView(article: article)
                    }
                    .buttonStyle(.plain)
                }
                .navigationTitle("NY Times News Feed")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
        .onAppear {
            Task {
                await viewModel.didSelectPeriod(period: seletedPeriod)
            }
        }
    }
}

#Preview {
    ArcticlesScreen()
}
