//
//  PassCodeInputTextField.swift.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import Foundation
import SwiftUI

protocol CharacterFieldBackspaceDelegate {
    /**
     - Parameter textField: A CharacterField instance
     */
    func charFieldWillDeleteBackward(_ textField: CharacterField)
}

class CharacterField: UITextField {
    public var willDeleteBackwardDelegate: CharacterFieldBackspaceDelegate?

    override func deleteBackward() {
        willDeleteBackwardDelegate?.charFieldWillDeleteBackward(self)
        super.deleteBackward()
    }

}

struct PassCodeInputCell : UIViewRepresentable {
    
    typealias UIViewType = CharacterField

    // No one else should change this
    var index: Int

    // Bound from a PassCodeInputModel instance
    @Binding var selectedCellIndex: Int
    @Binding var textReference: String
    
    func makeUIView(context: UIViewRepresentableContext<PassCodeInputCell>) -> CharacterField {

        let charField = CharacterField(frame: .zero)
        charField.textAlignment = .center

        // Caps and suggestions don't make sense
        charField.autocapitalizationType = .none
        charField.autocorrectionType = .no

        charField.delegate = context.coordinator
        charField.willDeleteBackwardDelegate = context.coordinator

        return charField
    }
    
    func updateUIView(_ uiView: CharacterField,
                      context: UIViewRepresentableContext<PassCodeInputCell>) {
        if index == selectedCellIndex {
            uiView.becomeFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(index: index, selectedCellIndex: self.$selectedCellIndex, textReference: self.$textReference)
    }

    class Coordinator : NSObject, UITextFieldDelegate, CharacterFieldBackspaceDelegate{
        
        // No one else should change this
        var index: Int
        // Each cell will update this
        @Binding var selectedCellIndex: Int
        // Reference to an index in the text array
        // from a PassCodeInputModel instance
        @Binding var textReference: String
        
        /**
         - Parameter index: Index of this cell in the pass code array
         - Parameter selectedCellIndex: index of where the user is upto
         - Parameter textReference: reference in the array to update input
         */
        init(index: Int, selectedCellIndex: Binding<Int>,
             textReference: Binding<String>) {
            // The underscore thing is important due to
            // the Binding<T> syntax
            _selectedCellIndex = selectedCellIndex
            _textReference = textReference
            self.index = index
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                        
            let currentText = textField.text ?? "" //textField.text? will almost assuredly never be nil, but we should always assume it could be
            guard let stringRange = Range(range, in: currentText) else { return false }
            let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
            
            // Increment the index if the change was on char
            if updatedText.count == 1 {
                self.selectedCellIndex += 1
            }
            print(selectedCellIndex)
            
            // Stop input if there's more than one character
            return updatedText.count <= 1
            
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            self.textReference = textField.text ?? ""
        }

        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            self.selectedCellIndex = self.index
            return true
        }

        func charFieldWillDeleteBackward(_ textField: CharacterField) {
            if(textField.text == "" && selectedCellIndex > 0) {
                self.selectedCellIndex -= 1
            }
        }

    }
}
