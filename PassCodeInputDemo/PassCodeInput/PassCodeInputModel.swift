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
            .allSatisfy { $0.count != 1 }
            .eraseToAnyPublisher()
    }
    
    /**
     - Returns: The number of cells in the pass code
     */
    var numberOfCells: Int {
        get {
            return self.passCode.count
        }
    }
    
    /**
     - Returns: A String with the current entered code
     */
    var passCodeString: String {
        get {
            return self.passCode.joined()
        }
    }
    
    /**
     - Parameters passCodeLength: Number of characters in passcode
     */
    init(passCodeLength: UInt) {
        
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
