//
//  OnboardingView.swift
//  BUTTERFLY-EFFECT
//
//  Created by fagri marouane on 7/7/2024.
//

import SwiftUI

// Sample data
var outdoorActivitiesData = [
    OutdoorActivity(title: "Customize Your Keyboard", headline: "Personalize your keyboard's appearance and functionality with various themes, colors, and layouts to match your style.", image: "keyboard", gradientColors: [Color.purple, Color.blue.opacity(0.5)]),
    OutdoorActivity(title: "Multiple Themes", headline: "Choose from a wide range of themes to keep your keyboard looking fresh and exciting.", image: "themes", gradientColors: [Color.purple, Color.blue.opacity(0.5)]),
    OutdoorActivity(title: "Get AI Tools", headline: "Enhance your typing with AI-powered features like predictive text, smart autocorrect, and voice typing.", image: "ai", gradientColors: [Color.purple, Color.blue.opacity(0.5)]),
]

struct OutdoorActivity: Identifiable {
    var id = UUID()
    var title: String
    var headline: String
    var image: String
    var gradientColors: [Color]
}

struct OnboardingView: View {
    @State private var isOnboardingActive: Bool = true
    init() {

        UIScrollView.appearance().bounces  = false
    }
    var body: some View {

        VStack {
            GeometryReader { geometry in
                    VStack{
                        if isOnboardingActive {
                                VStack(spacing: 20) {
                                       TabView {
                                ForEach(outdoorActivitiesData) { outdoorActivity in
                                    OnBoardingView(outDoorActivity: outdoorActivity, isOnboardingActive: $isOnboardingActive)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                                            ButtonView {
                                                isOnboardingActive = false
                                            }
                                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 24, trailing: 24))
                                    Spacer()
                                }
                        } else {
                            HowToView()
                        }
                    }
           }
        }
        .ignoresSafeArea()
        .onAppear {
           UIScrollView.appearance().bounces  = false
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
        )

    }
}

struct OnBoardingView: View {
    var outDoorActivity: OutdoorActivity
    @Binding var isOnboardingActive: Bool

    var body: some View {

                VStack(spacing: 20) {
                    Image(outDoorActivity.image)
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 3, x: 2, y: 2)
                        .frame(width: 240, height: 240)
                    
                    Text(outDoorActivity.title)
                        .fontWeight(.heavy)
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(
                            EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                        )
                    
                    Text(outDoorActivity.headline)
                        .fontWeight(.light)
                        .font(.system(size: 18))
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(
                            EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
                        )
                        .multilineTextAlignment(.center)

                
            
        }
    }

    
}

struct ButtonView: View {
    var onPress: () -> ()

    var body: some View {
        Text("Get Started")
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

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}


// #Preview {
//     OnboardingView()
// }