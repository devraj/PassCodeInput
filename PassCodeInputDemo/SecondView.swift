//
//  SecondView.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 10/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import SwiftUI

struct SecondView: View {

    @ObservedObject var passCodeModel: PassCodeInputModel

    var body: some View {
        Form {
            Section {
                PassCodeInputField(inputModel: self.passCodeModel)
            }
            Section {
                Button(LocalizedStringKey("Prompt_Engage"), action: {
                    print(
                        "Passcode is \(self.passCodeModel.passCodeString)"
                    )
                }).disabled(!self.passCodeModel.isValid)
            }
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(passCodeModel: PassCodeInputModel(passCodeLength: 8))
    }
}
