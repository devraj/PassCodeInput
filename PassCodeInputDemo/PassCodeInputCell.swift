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

            return true
            
        }
    }

    typealias UIViewType = UITextField

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        print("Hello")
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

}
