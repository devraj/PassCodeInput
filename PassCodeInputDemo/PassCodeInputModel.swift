//
//  PassCodeInputModel.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import Foundation
import SwiftUI

class PassCodeInputModel : ObservableObject {
    
    @Published var passCode: [String] = []
    @Published var isValid: Bool = false
    
    @Published var currentIndex: Int = 0

    
    
}
