//
//  GroupListView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 27/08/2023.
//

import SwiftUI

struct GroupListView: View {
    
    let groups: [Group]
    
    var body: some View {
        List(groups) { group in
            NavigationLink {
                Text(group.subject)
            } label: {
                HStack {
                    Image(systemName: "person.2")
                    Text(group.subject)
                }
            }
        }
        
    }
}

struct GroupListView_Previews: PreviewProvider {
    static var previews: some View {
        GroupListView(groups: [])
    }
}

