//
//  ContentView.swift
//  Pic-a-Pal
//
//  Created by MacBook Air on 30/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var names : [String] = []
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            VStack{
                Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick a Pal")
            }
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .bold()
            
            Text(pickedName.isEmpty ? "  " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List{
                ForEach(names, id: \.self){
                    name in Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            TextField("Add Name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            
            Toggle("Remove Picked Name", isOn: $shouldRemovePickedName)
            
            Button{
                if let randomName = names.randomElement(){
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll { name in
                            return (name == randomName)
                        }
                    }
                } else{
                    pickedName = ""
                }
            } label: {
                Text("Picked Random Name")
                    .padding(.vertical, 12)
                    .padding(.horizontal, 8)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
