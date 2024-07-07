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
        NavigationView {
            Color.purple.ignoresSafeArea()
                .overlay(
                    VStack{
                        if isOnboardingActive {
                            GeometryReader{
                                geometry in
                                VStack{
                                    GoView(onPress: {
                                        isOnboardingActive = false
                                    })
                                    ImageCarousel(
                                        width: geometry.size.width, height: geometry.size.height / 1.5
                                    )
                                }
                            }
                        }
                        else {
                            HomeView()
                        }
                    }
                    
                )
        }
    }
}

struct GoView: View {
    var onPress: () -> ()

    var body: some View {
        Button {
            onPress()
        } label: {
            HStack {
                Text("Gooo")
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
    HowToView()
}
