//
//  DetailedApplicationView.swift
//  CatergoriesApp-InClass5
//
//  Created by Gregory Hagins II on 11/7/23.
//

import SwiftUI

struct DetailedApplicationView: View {
    var appDetails:AppsDataViewModel.AppInfo
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            
            let appTitle = trimAppTitle(appTitle: appDetails.title)
            let appReleaseDate = trimAppReleaseDate(releaseDate: appDetails.releaseDate)
            
            AsyncImage(url: URL(string: appDetails.imgLarge)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150, alignment: .center)
                    .cornerRadius(15)
                    .shadow(radius: 8)
                
            } placeholder: {
                ProgressView()
                    .scaleEffect(5)
                    .tint(.gray)
                    .frame(width: 150, height: 150)
            }

            Text(appTitle)
                .fontWeight(.bold)
                
            Text(appDetails.developer)
                .fontWeight(.semibold)
            
            Text(appReleaseDate)
                .fontWeight(.semibold)
            
            Text(appDetails.price)
                .fontWeight(.semibold)
            
            Spacer()
            Spacer()
        }
    }
}

struct DetailedApplicationView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedApplicationView(appDetails: PlaceholderData().appInfo)
    }
}
