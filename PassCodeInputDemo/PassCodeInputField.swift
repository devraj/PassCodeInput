//
//  PassCodeInputField.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import SwiftUI

struct PassCodeInputField: View {
    
    @ObservedObject var inputModel: PassCodeInputModel
    
    var body: some View {
        HStack {
            ForEach(0 ..< 6) { index in
                PassCodeInputCell()
                    .frame(height: 20)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding([.trailing, .leading], 10)
                    .padding([.vertical], 15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.red.opacity(0.5), lineWidth: 2)
                    )
            }
        }
    }
}

struct PassCodeInputField_Previews: PreviewProvider {
    static var previews: some View {
        PassCodeInputField(inputModel: PassCodeInputModel())
    }
}
