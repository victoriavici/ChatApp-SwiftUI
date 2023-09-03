//
//  AppState.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 25/08/2023.
//

import Foundation

enum Route: Hashable {
    case main
    case login
    case signUp
}

class AppState: ObservableObject {
    
    @Published var routes: [Route] = []
    
}
