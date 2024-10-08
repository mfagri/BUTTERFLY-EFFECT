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
    @State private var selection = 0
    var body: some View {
              VStack{
                  GeometryReader{
                    g in 
                       if isOnboardingActive{
                         VStack{
                                   Spacer().frame(
                                        maxHeight: g.size.height / 4    
                                   )
                            VStack{
                                ForEach(0..<outdoorActivitiesData.count,id: \.self) { index in
                                if selection == index {
                                        OnBoardingView(outDoorActivity: outdoorActivitiesData[index])
                                              .transition(
                                        .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                                        .animation(.easeInOut
                                        
                                        )
                                }
                            }.padding(
                                .top, 50 
                            )
                            }
                            Spacer()
                            ButtonView(onPress: {
                                if selection < outdoorActivitiesData.count - 1 {
                                    selection += 1
                                } else {
                                    selection = 0
                                    isOnboardingActive = false
                                }
                            }, text:(selection < outdoorActivitiesData.count - 1) ? "Next" : "Get Started")
                            .frame(maxHeight: .infinity, alignment: .bottom)
                            .padding(.bottom, 60)
                    }
                    } else {
                        HowToView()
                    }
                }
              }  .background(
                        LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    ).ignoresSafeArea()
    }
}

struct OnBoardingView: View {
    var outDoorActivity: OutdoorActivity
    // @Binding var isOnboardingActive: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
                    Image(outDoorActivity.image)
                        .resizable()
                        .scaledToFit()
                        .shadow(color: Color(red: 0, green: 0, blue: 0), radius: 3, x: 2, y: 2)
                        .frame(width: 250, height: 250, alignment: .center)
                        .padding(
                            EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
                        )
                    
                    Text(outDoorActivity.title)
                        .fontWeight(.heavy)
                        .font(.system(size: 35))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(
                            EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
                        ) .fixedSize(horizontal: false, vertical: true)
                         .lineLimit(2)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .center
                        )
                    
                    Text(outDoorActivity.headline)
                        .fontWeight(.light)
                        .font(.system(size: 18))
                        .foregroundColor(Color.black.opacity(0.7))
                        .padding(
                            EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
                        )
                        .multilineTextAlignment(.center)
                         .fixedSize(horizontal: false, vertical: true)
                        .frame(
                            maxWidth: .infinity,
                            alignment: .center
                        ).lineLimit(5)
        }
    }

    
}

struct ButtonView: View {
    var onPress: () -> ()
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .font(.system(size: 20))
            .padding(.horizontal, 24)
            .padding(.vertical, 12)
            .background(
                Capsule().fill(Color.purple)
            )
            .foregroundColor(.white)
            .onTapGesture {
                onPress()
            }.frame(
                maxWidth: 200,
                alignment: .center
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