//
//  PassCodeInputCell.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import Foundation
import SwiftUI

struct PassCodeInputCell : UIViewRepresentable {
        
    class Coordinator : NSObject, UITextFieldDelegate {
        
        private var passCodeInputCell: PassCodeInputCell
        
        init(_ passCodeInputCell: PassCodeInputCell) {
            self.passCodeInputCell = passCodeInputCell
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            let currentText = textField.text!
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            // Stop input if there's more than one character
            return updatedText.count <= 1
            
        }
    }

    typealias UIViewType = UITextField

    // Index in the array
    @State var index: Int
    // Model
    @ObservedObject var inputModel: PassCodeInputModel
    // Current value of the textfield
    @State var value: String = ""
    // Is this the text field with the cursor
    @State var isFirstResponder: Bool = false

    func makeUIView(context: UIViewRepresentableContext<PassCodeInputCell>) -> UITextField {

        let textField = UITextField()
        textField.text = self.value
        textField.textAlignment = .center
        
        textField.delegate = context.coordinator

        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<PassCodeInputCell>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

}
