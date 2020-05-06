//
//  PassCodeInputModel.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 4/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class PassCodeInputModel : ObservableObject {
    
    @Published var passCode: [String] = []
    @Published var isValid: Bool = false
    
    @Published var selectedCellIndex: Int = 0
    
    private var passCodeValidPublisher: AnyPublisher<Bool, Never> {
        $passCode
        .removeDuplicates()
        .map { input in
            return true
        }
        .eraseToAnyPublisher()
    }
    
    var numberOfCells: Int {
        get {
            return self.passCode.count
        }
    }
    
    init(_ passCodeLength: Int) {
        for _ in 1...passCodeLength {
            self.passCode.append("")
        }
        print(self.numberOfCells)

    }
    
    
}
