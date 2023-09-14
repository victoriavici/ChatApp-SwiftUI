//
//  AppState.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 25/08/2023.
//

import Foundation

enum LoadingState: Hashable, Identifiable {
    case idle
    case loading(String)
    
    var id: Self {
        return self
    }
}


enum Route: Hashable {
    case main
    case login
    case signUp
}

class AppState: ObservableObject {
    
    @Published var loadingState: LoadingState = .idle
    @Published var routes: [Route] = []
    @Published var errorWrapper: ErrorWrapper?
}
