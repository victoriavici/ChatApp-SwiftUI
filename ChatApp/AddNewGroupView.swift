//
//  AddNewGroupView.swift
//  ChatApp
//
//  Created by Sebastian Mraz on 27/08/2023.
//

import SwiftUI

struct AddNewGroupView: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var groupSubject: String = ""
    @EnvironmentObject private var model: Model
    
    private var isFormValid: Bool {
        !groupSubject.isEmptyOrWhiteSpace
    }
    
    private func saveGroup() {
        let group = Group(subject: groupSubject)
        model.saveGroup(group: group) { error in
            if let error {
                print(error.localizedDescription)
            }
            dismiss()
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField("Group Subject", text: $groupSubject)
                }
                Spacer()
            }.toolbar {
                ToolbarItem(placement: .principal) {
                    Text("New group")
                        .bold()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Create") {
                        saveGroup()
                    }.disabled(!isFormValid)
                }
            }
        }
        .padding()
    }
}

struct AddNewGroupView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddNewGroupView().environmentObject(Model())
        }
    }
}
