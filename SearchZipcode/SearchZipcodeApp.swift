//
//  SearchZIipcodeApp.swift
//  SearchZIipcode
//
//  Created by 田中大地 on 2022/05/14.
//

import SwiftUI

@main
struct SearchZipcodeApp: App {
    @StateObject var viewModel = ZipcodeViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
