//
//  PassCodeInputTextField.swift.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit
import Combine

struct PassCodeInputCell : UIViewRepresentable {
        
    class Coordinator : NSObject, UITextFieldDelegate {
        
        @Binding var selectedCellIndex: Int
        
        init(_ selectedCellIndex: Binding<Int>) {
            // The underscore thing is important?
            // writing self.selectedCellIndex = selectedCellIndex
            // does not work
            _selectedCellIndex = selectedCellIndex
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            
            let currentText = textField.text!
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            // Increment the index if the change was on char
            if updatedText.count <= 1 {
                self.selectedCellIndex += 1
            }
            
            // Stop input if there's more than one character
            return updatedText.count <= 1
            
        }
    }

    typealias UIViewType = UITextField

    @Binding var selectedCellIndex: Int
    
    func makeUIView(context: UIViewRepresentableContext<PassCodeInputCell>) -> UITextField {

        let textField = UITextField()
        textField.textAlignment = .center
        
        textField.delegate = context.coordinator

        return textField
    }
    
    func updateUIView(_ uiView: UITextField,
                      context: UIViewRepresentableContext<PassCodeInputCell>) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self.$selectedCellIndex)
    }

}
