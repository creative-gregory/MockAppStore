//
//  AppsDataViewModel.swift
//  CatergoriesApp-InClass5
//
//  Created by Gregory Hagins II
//

import Foundation

@MainActor class AppsDataViewModel: ObservableObject {
    enum LoadingState {
        case idle
        case loading
        case loaded([String: [AppInfo]])
        case failed(Error)
    }
    
    struct AppsData: Codable {
        var applicationInfo: [String: [AppInfo]]
    }
    
   struct AppInfo: Codable {
        var id: String
        var title: String
        var developer: String
        var imgSmall: String
        var imgLarge: String
        var releaseDate: String
        var price: String
    }
    
    @Published var state: LoadingState = .idle
    
    func getAppsData(fileName: String) async {
        self.state = .loading
        
        guard let jsonFile = Bundle.main.url(forResource: fileName, withExtension: nil) else {
            print("Json file not found.")
            return
        }
        
        do {
            let data = try Data(contentsOf: jsonFile)
            
            do {
                let AppsData = try JSONDecoder().decode([String: [AppInfo]].self, from: data)
                self.state = .loaded(AppsData)
                
                print("Success: Retrieved JSON data has been parsed.")
            } catch let jsonError as NSError {
                self.state = .failed(jsonError)
                print("JSON decode failed: \(jsonError).")
            }
        } catch {
            print("Error: Could not retrieve JSON data from file.)")
        }
    }
}
