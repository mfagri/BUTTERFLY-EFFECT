//
//  ContentView.swift
//  Shared
//
//  Created by Marouane Fagri on 7/1/24.
//

import SwiftUI

import KeyboardKit


@available(OSX 11.0, *)
struct ContentView: View {
   
    var body: some View {
        GeometryReader { geometry in
            Text("Hello, World!")
               
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
