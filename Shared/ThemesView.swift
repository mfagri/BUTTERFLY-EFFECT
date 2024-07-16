//
//  ThemesView.swift
//  BUTTERFLY-EFFECT
//
//  Created by fagri marouane on 11/7/2024.
//

import SwiftUI
import UIKit

struct Theme {
    let selectedColor: Color
    let backgroundColor: Color
    let foregroundColor: Color
    let backgroundImage: String
    let isHaveImage: Bool
    let buttonColor: Color
    let buttonTextColor: Color
    let buttonCorner: CGFloat
    let isInThemes: Bool
}

let themes = [
    Theme(selectedColor: Color(.white), backgroundColor: Color(.white), foregroundColor: Color(.black), backgroundImage: "bg1", isHaveImage: true, buttonColor: Color(.blue), buttonTextColor: Color(.white), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(.black), backgroundColor: Color(.gray), foregroundColor: Color(.white), backgroundImage: "bg2", isHaveImage: true, buttonColor: Color(.gray), buttonTextColor: Color(.yellow), buttonCorner: 15, isInThemes: false),
    Theme(selectedColor: Color(.red), backgroundColor: Color(.black), foregroundColor: Color(.red), backgroundImage: "bg1", isHaveImage: false, buttonColor: Color(.red), buttonTextColor: Color(.white), buttonCorner: 10, isInThemes: false),
    Theme(selectedColor: Color(.blue), backgroundColor: Color(.lightGray), foregroundColor: Color(.blue), backgroundImage: "bg1", isHaveImage: false, buttonColor: Color(.cyan), buttonTextColor: Color(.black), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(.green), backgroundColor: Color(.white), foregroundColor: Color(.green), backgroundImage: "bg2", isHaveImage: true, buttonColor: Color(.green), buttonTextColor: Color(.green), buttonCorner: 5, isInThemes: false),
    Theme(selectedColor: Color(.orange), backgroundColor: Color(.gray), foregroundColor: Color(.orange), backgroundImage: "bg1", isHaveImage: false, buttonColor: Color(.orange), buttonTextColor: Color(.white), buttonCorner: 30, isInThemes: false),
    Theme(selectedColor: Color(.purple), backgroundColor: Color(.gray), foregroundColor: Color(.purple), backgroundImage: "bg2", isHaveImage: true, buttonColor: Color(.purple), buttonTextColor: Color(.white), buttonCorner: 15, isInThemes: false)
    // Theme(selectedColor: Color(.pink), backgroundColor: Color(.white), foregroundColor: Color(.pink), backgroundImage: "bg2", isHaveImage: false, buttonColor: Color(.pink), buttonTextColor: Color(.black), buttonCorner: 25, isInThemes: true),
    // Theme(selectedColor: Color(.cyan), backgroundColor: Color(.black), foregroundColor: Color(.cyan), backgroundImage: "bg2", isHaveImage: true, buttonColor: Color(.cyan), buttonTextColor: Color(.black), buttonCorner: 10, isInThemes: false),
    // Theme(selectedColor: Color(.yellow), backgroundColor: Color(.darkGray), foregroundColor: Color(.yellow), backgroundImage: "bg1", isHaveImage: false, buttonColor: Color(.yellow), buttonTextColor: Color(.black), buttonCorner: 20, isInThemes: true),
    // Theme(selectedColor: Color(.brown), backgroundColor: Color(.white), foregroundColor: Color(.brown), backgroundImage: "bg1", isHaveImage: true, buttonColor: Color(.brown), buttonTextColor: Color(.white), buttonCorner: 5, isInThemes: false),
    // Theme(selectedColor: Color(.teal), backgroundColor: Color(.lightGray), foregroundColor: Color(.teal), backgroundImage: "bg2", isHaveImage: false, buttonColor: Color(.teal), buttonTextColor: Color(.black), buttonCorner: 30, isInThemes: true),
    // Theme(selectedColor: Color(.indigo), backgroundColor: Color(.darkGray), foregroundColor: Color(.indigo), backgroundImage: "bg1", isHaveImage: true, buttonColor: Color(.indigo), buttonTextColor: Color(.white), buttonCorner: 15, isInThemes: false),
    // Theme(selectedColor: Color(.maroon), backgroundColor: Color(.black), foregroundColor: Color(.maroon), backgroundImage: "bg1", isHaveImage: false, buttonColor: Color(.maroon), buttonTextColor: Color(.white), buttonCorner: 25, isInThemes: true),
    // Theme(selectedColor: Color(.gold), backgroundColor: Color(.lightGray), foregroundColor: Color(.gold), backgroundImage: "bg2", isHaveImage: true, buttonColor: Color(.gold), buttonTextColor: Color(.black), buttonCorner: 10, isInThemes: false),
    // Theme(selectedColor: Color(.silver), backgroundColor: Color(.white), foregroundColor: Color(.silver), backgroundImage: "bg1", isHaveImage: false, buttonColor: Color(.silver), buttonTextColor: Color(.black), buttonCorner: 20, isInThemes: true),
    // Theme(selectedColor: Color(.lavender), backgroundColor: Color(.darkGray), foregroundColor: Color(.lavender), backgroundImage: "bg2", isHaveImage: true, buttonColor: Color(.lavender), buttonTextColor: Color(.black), buttonCorner: 5, isInThemes: false),
    // Theme(selectedColor: Color(.salmon), backgroundColor: Color(.black), foregroundColor: Color(.salmon), backgroundImage: "bg2", isHaveImage: false, buttonColor: Color(.salmon), buttonTextColor: Color(.white), buttonCorner: 30, isInThemes: true),
    // Theme(selectedColor: Color(.lime), backgroundColor: Color(.white), foregroundColor: Color(.lime), backgroundImage: "bg1", isHaveImage: true, buttonColor: Color(.lime), buttonTextColor: Color(.black), buttonCorner: 15, isInThemes: false),
    // Theme(selectedColor: Color(.navy), backgroundColor: Color(.lightGray), foregroundColor: Color(.navy), backgroundImage: "bg2", isHaveImage: false, buttonColor: Color(.navy), buttonTextColor: Color(.white), buttonCorner: 25, isInThemes: true)
]

struct ThemesView: View {
         @State private var isOn = false
    var body: some View {
        GeometryReader {
            inGeometry in
               VStack{
              LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                 VStack{
                    //   ScrollView(.vertical, showsIndicators: false){
                          VStack{
                              HStack{
                                  Text("Themes")
                                  .foregroundColor(.white).font(.system(size: 26, weight: .bold, design: .default))
                                  Spacer()
                              }.padding(
                                  EdgeInsets(top: 50, leading: 24, bottom: 24, trailing: 24)
                              )
                              //theme selection
                              VStack{
                                  HStack{
                                      Text("Select a theme")
                                      .foregroundColor(Color.white.opacity(0.7)).font(.system(size: 18, weight: .bold, design: .default))
                                      Spacer()
                                  }.padding(
                                      EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                                  )
                                  //theme selection
                                  ScrollView(.vertical, showsIndicators: false){
                                      VStack(spacing:40){
                                              Spacer().frame(
                                      height: 20
                                  )
                                          ForEach(themes.indices, id: \.self) { index in
                                          let theme = themes[index]
                                            ZStack{

                                                    HStack{
                                                    Rectangle()
                                                        .fill(theme.selectedColor)
                                                        .frame(width: inGeometry.size.width - 20 , height: inGeometry.size.height/3.5)
                                                        .cornerRadius(10)
                                                }.rotation3DEffect(Angle(degrees: (index % 2 != 0) ? 1 : -1), axis: (x: 0, y: 0, z: 1))
                                                .overlay(
                                                                                                    // ViewKeyboard(selectedColor: Color(.white), backgroundColor: Color(.white), foregroundColor: Color(.black), backgroundImage: "bg1", IshaveImage: false, bottunColor: Color(.blue), buttonTextColor: Color(.white), buttoncurner: 20,keyboardWidth: inGeometry.size.width - 60, isInthemes: false)
                                                                                                    ViewKeyboard(
                    selectedColor: theme.selectedColor,
                    backgroundColor: theme.backgroundColor,
                    foregroundColor: theme.foregroundColor,
                    backgroundImage: theme.backgroundImage,
                    IshaveImage: theme.isHaveImage,
                    bottunColor: theme.buttonColor,
                    buttonTextColor: theme.buttonTextColor,
                    buttoncurner: theme.buttonCorner,
                    keyboardWidth: UIScreen.main.bounds.width - 80,
                    isInthemes: theme.isInThemes
                )
                .frame(height: 210) // Adjust frame height as needed
                .padding(
                    EdgeInsets(top:0,leading:20,bottom:0,trailing:20)
                ).rotation3DEffect(Angle(degrees: (index % 2 != 0) ? 1 : -1), axis: (x: 0, y: 0, z: 1))
                                                )
                                                VStack{
                                                  HStack{
                                                    Spacer()
                                                       HStack{
                                                    Rectangle()
                                                        .fill(Color.white)
                                                        .frame(width:30 , height: 30)
                                                        .cornerRadius(10)
                                                        .shadow(
                                                            color: Color.black.opacity(0.5),
                                                            radius: 2, x: 0, y: 0
                                                        ).overlay(
                                                          
                                                            Image(systemName: "checkmark")
                                                                .resizable()
                                                                .frame(width: 20, height: 20)
                                                                .foregroundColor(Color(hex: 0x7cb2fd))
                                                        )
                                                       }
                                                       .padding(
                                                            EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
                                                        
                                                       )
                                                }
                                                Spacer()
                                                }
                                              }.frame(width: inGeometry.size.width, height: 270)
                                              .padding(
                                                    EdgeInsets(top: 15, leading: 0, bottom: 20, trailing: 0)
                                              )
                                            
                                          }
                                           Spacer().frame(
                                      height: 90
                                  )
                                      }
                                  }
                                 
                              }
                        //   }

                      }
                 }
                )
          }
        }
        
    }
}

// extension Color {
//     init(hex: UInt, alpha: Double = 1) {
//         self.init(
//             .sRGB,
//             red: Double((hex >> 16) & 0xff) / 255,
//             green: Double((hex >> 08) & 0xff) / 255,
//             blue: Double((hex >> 00) & 0xff) / 255,
//             opacity: alpha
//         )
//     }
// }

#Preview {
    ThemesView()
}
