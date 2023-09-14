//
//  ErrorView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 14/09/2023.
//

import SwiftUI

struct ErrorView: View {
    
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        VStack {
            Text("An error has occured!")
                .font(.title)
                .padding(.bottom)
            Text(errorWrapper.error.localizedDescription)
                .font(.headline)
            Text(errorWrapper.guidance)
                .font(.caption)
                .padding(.top)
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}

struct ErrorView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        ErrorView(errorWrapper: ErrorWrapper(error: "aa" as! Error))
    }
}
