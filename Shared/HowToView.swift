//
//  HowToView.swift
//  BUTTERFLY-EFFECT
//
//  Created by fagri marouane on 7/7/2024.
//

import SwiftUI


struct HowToView: View {
    @State private var isOnboardingActive: Bool = true
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                    VStack{
                        if isOnboardingActive {
                                VStack {
                                    Spacer()
                                    Text("How to use KeYbAI")
                                        .font(.system(size: 30, weight: .bold, design: .default))
                                        .padding(.top, geometry.size.height / 9.5)
                                        .padding(.horizontal, 20)
                                        .foregroundColor(Color.white)
                                    ImageCarousel(width: geometry.size.width, height: geometry.size.height / 1.5)                                 
                                    
                                            GoView {
                                                isOnboardingActive = false
                                            }
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 24))
                                    Spacer()
                                    }
                                
                        } else {
                            MainView()
                        }
                    }
           }
        }
        .ignoresSafeArea()
        .onAppear {
           UIScrollView.appearance().bounces  = false
        }
        // .background(
        //     LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
        // )
    }
    
}

struct GoView: View {
    var onPress: () -> Void

    var body: some View {
        Text("Go to Home")
              .fontWeight(.bold)
            .font(.system(size: 20))
            .padding(.horizontal, 25)
            .padding(.vertical, 12)
            .background(
                // Capsule().strokeBorder(lineWidth: 2)
                Capsule().fill(Color.purple)
            )
            .foregroundColor(.white)
            .onTapGesture {
                onPress()
            }.frame(
                maxWidth: 200,
                alignment: .trailing
            )

    }
}

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        HowToView()
    }
}

// #Preview {
//     HowToView()
// }
