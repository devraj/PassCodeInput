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

    private var cancellableSet: Set<AnyCancellable> = []
    private var passCodeValidPublisher: AnyPublisher<Bool, Never> {
        $passCode
        .removeDuplicates()
        .map { input in
            var validity = true
            // FIXME: - Find a better way of doing this?
            input.forEach {
                if $0.count != 1 {
                    validity = false
                    return
                }
            }
            return validity
        }
        .eraseToAnyPublisher()
    }
    
    var numberOfCells: Int {
        get {
            return self.passCode.count
        }
    }
    
    var passCodeString: String {
        get {
            return self.passCode.joined()
        }
    }
    
    init(_ passCodeLength: Int) {
        
        // FIXME: - Is there a better way of doing this?
        for _ in 1...passCodeLength {
            self.passCode.append("")
        }

        passCodeValidPublisher
        .receive(on: RunLoop.main)
        .assign(to: \.isValid, on: self)
        .store(in: &cancellableSet)

    }
    
    
}
