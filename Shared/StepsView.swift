//
//  StepsView.swift
//  BUTTERFLY-EFFECT
//
//  Created by fagri marouane on 7/7/2024.
//

import SwiftUI

struct Step: Identifiable {
    let id = UUID()
    let image: String
    let description: String
}

struct ImageCarousel: View {
    //take with of the screen from geometry reader as a parameter
    private let width: CGFloat
    private let height: CGFloat
    
    init(width: CGFloat,height: CGFloat) {
       self.width = width
        self.height = height
    }
    

    private let steps: [Step] = [
        Step(image: "step1", description: "Open the keyboard settings"),
        Step(image: "step2", description: "Tap on 'Keyboards'"),
        Step(image: "step3", description: "Tap on 'Add New Keyboard'"),
        Step(image: "step4", description: "Select 'Custom Keyboard'"),
        Step(image: "step5", description: "Select KeYbAI Keyboard")
    ]
    
    var body: some View {
        TabView {
            ForEach(steps) { step in
                VStack {
                 
                       GroupBox(label: Text("   \(step.description)")) {
                            VStack(alignment: .leading) {
                            Image(step.image)
                                                    .resizable()
                                                    .frame(width: self.width * 0.8, height: self.height / 2)
                                                    .cornerRadius(10)
                                                    .padding(10)
                            }
                        

                       }.padding(
                            .horizontal
                       )
                    
                   
                }      
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct ImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            ImageCarousel(width: geometry.size.width, height: 340)
        }
    }
}
