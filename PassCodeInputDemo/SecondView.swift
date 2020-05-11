//
//  SecondView.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 10/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import SwiftUI

struct SecondView: View {

    @ObservedObject var inputModel: PassCodeInputModel

    var body: some View {
        Form {
            Section {
                PassCodeInputField(inputModel: self.inputModel)
            }
            Section {
                Button(LocalizedStringKey("Engage"), action: {
                    print(
                        "Passcode is \(self.inputModel.passCodeString)"
                    )
                }).disabled(!self.inputModel.isValid)
            }
        }
        .onAppear() {
            print("Second View Appears")
            print(self.inputModel.selectedCellIndex)
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView(inputModel: PassCodeInputModel(passCodeLength: 8))
    }
}
