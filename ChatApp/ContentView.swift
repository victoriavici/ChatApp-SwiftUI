//
//  ContentView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 22/08/2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: ChatAppDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(ChatAppDocument()))
    }
}
