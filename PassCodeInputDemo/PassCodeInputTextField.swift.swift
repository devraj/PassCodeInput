//
//  PassCodeInputTextField.swift.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import Foundation
import SwiftUI

struct PassCodeInputTextField : UIViewRepresentable {
        
    class Coordinator : NSObject, UITextFieldDelegate {
        
        private var passCodeInputTextField: PassCodeInputTextField
        
        init(_ passCodeInputTextField: PassCodeInputTextField) {
            self.passCodeInputTextField = passCodeInputTextField
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
    
    var cellIndex: Int

    func makeUIView(context: UIViewRepresentableContext<PassCodeInputTextField>) -> UITextField {

        let textField = UITextField()
        textField.textAlignment = .center
        
        textField.delegate = context.coordinator

        return textField
    }
    
    func updateUIView(_ uiView: UITextField,
                      context: UIViewRepresentableContext<PassCodeInputTextField>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

}
