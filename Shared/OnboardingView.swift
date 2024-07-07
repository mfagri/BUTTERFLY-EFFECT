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

    var body: some View {
        NavigationView {
            Color.purple.ignoresSafeArea()
                .overlay(
                    VStack{
                        if isOnboardingActive {
                            TabView {
                                ForEach(outdoorActivitiesData) { item in
                                    OnBoardingView(outDoorActivity: item, isOnboardingActive: $isOnboardingActive)
                                }
                            }
                            .tabViewStyle(PageTabViewStyle())
                            .ignoresSafeArea()
                        } else {
                            HowToView()
                        }
                    }
                )
        }
    }
}

struct OnBoardingView: View {
    var outDoorActivity: OutdoorActivity
    @Binding var isOnboardingActive: Bool

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Image(outDoorActivity.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 3, x: 2, y: 2)
                Text(outDoorActivity.title)
                    .fontWeight(.heavy)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                Text(outDoorActivity.headline)
                    .fontWeight(.light)
                    .font(.system(size: 18))
                    .foregroundColor(.black.opacity(0.7))
                    .padding(.bottom, 15)
                    .multilineTextAlignment(.center)
                
                ButtonView(onPress: {
                    isOnboardingActive = false
                })
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .background(
                LinearGradient(colors: outDoorActivity.gradientColors, startPoint: .top, endPoint: .bottom)
            )
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

struct ButtonView: View {
    var onPress: () -> ()

    var body: some View {
        Button {
            print("Button Pressed")
            onPress()
        } label: {
            HStack {
                Text("Start")
                Image(systemName: "arrow.forward.circle")
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 12)
            .background(
                Capsule().strokeBorder(lineWidth: 2)
            )
            .foregroundColor(.white)
        }
        .buttonStyle(.plain)
        .accentColor(.white)
    }
}



#Preview {
    OnboardingView()
}

