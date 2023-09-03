//
//  MainView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 25/08/2023.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            GroupListContainerView()
                .tabItem {
                    Label("Chats", systemImage: "message.fill")
                }
            SettingView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
