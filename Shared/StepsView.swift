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
                Spacer().frame(
                        height: 24
                    )
                 VStack {
                     Rectangle()
                         .fill(Color.gray.opacity(0.0))
                         .frame(width: self.width - 20, height: self.height * 0.6)
                    .cornerRadius(10)
                    // .shadow(radius: 1)
                    .padding(10)
                   
                    .overlay(
                        VStack{
                            Image(step.image)
                            .resizable()
                            .frame(width: self.width - 20, height: self.height / 2)
                            .cornerRadius(10)
                            .padding(10)
                            Spacer().frame(
                                height:20)
                            Text(step.description)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            Spacer()

                        }
                        .padding(24)
                    )
                 }
                    
                }
                   
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .background(
            LinearGradient(colors:[ Color.purple,Color.blue.opacity(0.5)], startPoint: .top, endPoint: .bottom)
        ).ignoresSafeArea()
//        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))//i want to show the index always
//        .frame(width: width, height: height * 0.7)

        // .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250)
        
    }
}

struct ImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            ImageCarousel(width: geometry.size.width, height: 340)
        }
    }
}
