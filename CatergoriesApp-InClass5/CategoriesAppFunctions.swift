//
//  CategoriesAppFunctions.swift
//  CatergoriesApp-InClass5
//
//  Created by Gregory Hagins II
//

import Foundation

func trimAppTitle(appTitle: String) -> String {
    return String(appTitle.split(separator: " -")[0])
}

func trimAppReleaseDate(releaseDate: String) -> String {
    var resultString:String = ""
    
    let date = String(releaseDate.split(separator: "T")[0])
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    if let formattedDate = dateFormatter.date(from: date) {
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        resultString = dateFormatter.string(from: formattedDate)
    }

    return resultString
}




