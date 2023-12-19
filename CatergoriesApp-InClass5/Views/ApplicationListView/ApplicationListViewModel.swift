//
//  ApplicationListViewModel.swift
//  CatergoriesApp-InClass5
//
//  Created by Gregory Hagins II
//

import Foundation

final class ApplicationListViewModel: ObservableObject {
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded(ConsumerApp)
    }
    
    @Published var appCollection = [ConsumerApp]()
    
//    func fetchAppCollectionData(selectedCategory: String) {
//        
//        appCollection = ConsumerAppData.data["\(selectedCategory)"]!
//    }
    
    @Published var title:String = ""
    @Published var developer:String = ""
    @Published var date:String = ""
    @Published var icon:String = ""
    @Published var price:String = ""
    
    var iconURL = "https://is2-ssl.mzstatic.com/image/thumb/Purple118/v4/fb/f6/31/fbf6313d-c17c-6c1b-d992-513d42cd8d5e/AppIcon-1x_U007emarketing-85-220-8.png/53x53bb-85.png"
    
    private struct ConsumerAppInfo: Codable {
        var title:String = ""
        var developer:String = ""
        var date:String = ""
        var icon:String = ""
        var price:String = ""
    }
    
    func getApplicationIcon() async {
        print("Accessing URL: \(iconURL)")
        
        guard let url = URL(string: iconURL) else {
            print("Error accessing URL from: \(iconURL)")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
        }
        catch {
            print("Error: Could not access URL at \(icon) to get data and response")
        }
    }
    
    func unwrapApplicationData(app: ConsumerApp) {
        guard let appTitle = app.title else { return }
        guard let appDeveloper = app.developer else { return }
        guard let appReleaseDate = app.releaseDate else { return }
        guard let appImage = app.imgLarge else { return }
        guard let appPrice = app.price else { return }
        
        title = trimAppTitle(appTitle: appTitle)
        developer = appDeveloper
        date = trimAppReleaseDate(releaseDate: appReleaseDate)
        icon =  appImage
        price = appPrice
        
//        return title
    }

    func getCollectionData(category: String) -> [ConsumerApp]{
        guard let collectionData = ConsumerAppData.data[category] else { return [] }
        
        return collectionData
    }
}
