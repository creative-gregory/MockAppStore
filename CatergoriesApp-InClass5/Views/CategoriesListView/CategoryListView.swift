//
//  CategoryListView.swift
//  CatergoriesApp-InClass5
//
//  Created by Gregory Hagins
//

import SwiftUI

struct CategoryListView: View {
//    init() {
//        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
//        UINavigationBar.setAnimationsEnabled(false)
//    }
    
    @StateObject private var appsDataVM = AppsDataViewModel()
    
    var body: some View {
        ZStack {
            switch appsDataVM.state {
            case .idle:
                EmptyView()
                
            case .loading:
                ProgressView("Loading Application Data")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color(.systemBackground)))
                    .shadow(radius: 10)
                
            case .loaded(let apps):
                VStack {
                    CategoryView(appData: apps)
                }
                
            case .failed(let error):
                Text("\(error.localizedDescription)")
                
            }
        }
        .task {
            await appsDataVM.getAppsData(fileName: "AppsData.json")
        }
    }
}

struct CategoryView: View {
    var appData: [String: [AppsDataViewModel.AppInfo]]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(appData.sorted(by: {$0.key < $1.key} ), id: \.key) { category, collection in
                    
                    NavigationLink(destination: ApplicationListView(category: category, categoryCollection: collection), label: {
                        Text(category)
                            .multilineTextAlignment(.leading)
                            .fontWeight(.bold)
                    })
                }
            }
            .navigationTitle("Categories")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
