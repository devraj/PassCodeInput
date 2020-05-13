//
//  ModalRootView.swift
//  PassCodeInputDemo
//
//  Created by Dev Mukherjee on 12/5/20.
//  Copyright © 2020 Anomaly Software. All rights reserved.
//

import SwiftUI

struct ModalRootView: View {

    @ObservedObject var childPassCodeModel = PassCodeInputModel(passCodeLength: 6)

    var body: some View {
        NavigationView {
            List {
                ForEach(0..<5) { index in
                    Text("List Item")
                }
            }
            .navigationBarTitle(LocalizedStringKey("ModalView"))
            .navigationBarItems(trailing: NavigationLink(destination:
                SecondView(passCodeModel: self.childPassCodeModel)
                .navigationBarTitle(LocalizedStringKey("NestedView")))
            {
              Text(LocalizedStringKey("Child View"))
            })
        }
    }
}

struct ModalRootView_Previews: PreviewProvider {
    static var previews: some View {
        ModalRootView()
    }
}
