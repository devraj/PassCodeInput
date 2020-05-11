//
//  ContentView.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 1/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import SwiftUI

/**
 Creates a shake animation, useful in denoting a failed
 input attempt.
 
 With a little help from:
 - [How to create an explicit animation](https://www.hackingwithswift.com/quick-start/swiftui/how-to-create-an-explicit-animation)
 - [SwiftUI: Shake Animation](https://www.objc.io/blog/2019/10/01/swiftui-shake-animation/)
*/
struct Shake: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
            y: 0))
    }
}

struct ContentView: View {
    
    @ObservedObject var passCodeModel = PassCodeInputModel(passCodeLength: 6)
    @ObservedObject var secondModel = PassCodeInputModel(passCodeLength: 6)
    @State var attempts: Int = 0

    var body: some View {
        NavigationView {
            Form {
                Section {
                    PassCodeInputField(inputModel: self.passCodeModel)
                    .modifier(Shake(animatableData: CGFloat(attempts)))
                }
                Section {
                    Button(LocalizedStringKey("Prompt_ShakeOff"), action: {
                        print("Passcode is \(self.passCodeModel.passCodeString)")

                        withAnimation(.default) {
                            self.attempts += 1
                        }
                        
                    }).disabled(!self.passCodeModel.isValid)
                }
            }
            .navigationBarTitle(LocalizedStringKey("First View"))
            .navigationBarItems(trailing: NavigationLink(destination:
                SecondView(passCodeModel: self.secondModel)
                .navigationBarTitle(LocalizedStringKey("NestedView")))
            {
              Text(LocalizedStringKey("Second"))
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
