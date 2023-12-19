//
//  ApplicationListView.swift
//  CatergoriesApp-InClass5
//
//  Created by Gregory Hagins II
//

import SwiftUI

struct ApplicationListView: View {
    var category: String
    var categoryCollection: [AppsDataViewModel.AppInfo]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(categoryCollection, id: \.id) { appData in
                    let title = trimAppTitle(appTitle: appData.title)
                    let releaseDate = trimAppReleaseDate(releaseDate: appData.releaseDate)
                    
                    NavigationLink(destination: DetailedApplicationView(appDetails: appData), label: {
                        
                        HStack {
                            AsyncImage(url: URL(string: appData.imgLarge)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 75, alignment: .leading)
                                    .cornerRadius(15)
                                    .shadow(radius: 8)
                                
                            } placeholder: {
                                ProgressView()
                                    .scaleEffect(1)
                                    .tint(.gray)
                                    .frame(maxHeight: 75)
                                    .frame(width: 75, height: 75)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading) {
                                Text(title)
                                    .fontWeight(.bold)
                                    .padding(0.5)
                                
                                Text(appData.developer)
                                    .padding(0.5)
                                
                                HStack {
                                    Text(releaseDate)
                                        .padding(0.5)
                                        .minimumScaleFactor(0.01)
                                        .scaledToFill()
                                    
                                    Spacer()
                                    
                                    Text(appData.price)
                                        .padding(0.5)
                                        .minimumScaleFactor(0.01)
                                        .scaledToFill()
                                }
                            }
                        }
                    })
                }
            }
            .navigationTitle("Applications - \(category)")
        }
        .onAppear() {
            print(category)
        }
    }
}

struct ApplicationListView_Previews: PreviewProvider {
    static var previews: some View {
        ApplicationListView(category: PlaceholderData().category, categoryCollection: [
            PlaceholderData().appInfo
          ])
    }
}
