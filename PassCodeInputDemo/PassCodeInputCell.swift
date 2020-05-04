//
//  PassCodeInputTextField.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import Foundation
import SwiftUI

struct PassCodeInputCell: View {
    
    @State var cellIndex: Int
    
    var body: some View {
        PassCodeInputTextField(cellIndex: self.cellIndex)
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

struct PassCodeInputCell_Previews: PreviewProvider {
    static var previews: some View {
        PassCodeInputCell(cellIndex: 0)
    }
}
