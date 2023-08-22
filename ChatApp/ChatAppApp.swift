//
//  ChatAppApp.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 22/08/2023.
//

import SwiftUI

@main
struct ChatAppApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: ChatAppDocument()) { file in
            ContentView(document: file.$document)
        }
    }
}
