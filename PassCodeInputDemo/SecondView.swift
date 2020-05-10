//
//  SecondView.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 10/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import SwiftUI

struct SecondView: View {

    @ObservedObject var secondModel = PassCodeInputModel(passCodeLength: 6)

    var body: some View {
        Form {
            Section {
                PassCodeInputField(inputModel: self.secondModel)
            }
            Section {
                Button(LocalizedStringKey("Engage"), action: {
                    print(
                        "Passcode is \(self.secondModel.passCodeString)"
                    )
                }).disabled(!self.secondModel.isValid)
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
