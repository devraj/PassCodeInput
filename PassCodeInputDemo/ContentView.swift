//
//  ContentView.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 1/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var passCodeModel = PassCodeInputModel(6)
    
    var body: some View {
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
