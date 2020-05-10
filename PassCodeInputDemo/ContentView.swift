//
//  ContentView.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 1/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var passCodeModel = PassCodeInputModel(passCodeLength: 6)
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    PassCodeInputField(inputModel: self.passCodeModel)
                }
                Section {
                    Button(LocalizedStringKey("Engage"), action: {
                        print(
                            "Passcode is \(self.passCodeModel.passCodeString)"
                        )
                    }).disabled(!self.passCodeModel.isValid)
                }
            }
            .navigationBarTitle(LocalizedStringKey("First View"))
            .navigationBarItems(trailing: NavigationLink(destination: SecondView()) {
              Text(LocalizedStringKey("Second"))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
