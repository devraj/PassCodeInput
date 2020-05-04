//
//  ContentView.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 1/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section {
                PassCodeInputField()

            }
            Section {
                Button(LocalizedStringKey("I'm Ready"), action: {
                  
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
