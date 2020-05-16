//
//  ContentView.swift
//  KeyboardEdges
//
//  Created by Франчук Андрей on 16.05.2020.
//  Copyright © 2020 Франчук Андрей. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Spacer()
            SwiftUIContainer()
                .frame(height: 250)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
