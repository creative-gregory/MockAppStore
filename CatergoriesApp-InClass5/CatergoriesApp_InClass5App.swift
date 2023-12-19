//
//  CatergoriesApp_InClass5App.swift
//  CatergoriesApp-InClass5
//
//  Created by Gregory Hagins II
//

import SwiftUI

@main
struct CatergoriesApp_InClass5App: App {
    init() {
        UILabel.appearance(whenContainedInInstancesOf: [UINavigationBar.self]).adjustsFontSizeToFitWidth = true
        UINavigationBar.setAnimationsEnabled(false)
    }
    
    var body: some Scene {
        WindowGroup {
            CategoryListView()
        }
    }
}
