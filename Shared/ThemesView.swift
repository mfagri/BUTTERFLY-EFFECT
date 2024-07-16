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
    Theme(selectedColor: Color(hex: "#FFFFFF"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#000000"), backgroundImage: "bg1", isHaveImage: true, buttonColor: Color(hex: "#0000FF"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(hex: "#000000"), backgroundColor: Color(hex: "#808080"), foregroundColor: Color(hex: "#FFFFFF"), backgroundImage: "bg2", isHaveImage: true, buttonColor: Color(hex: "#A9A9A9"), buttonTextColor: Color(hex: "#FFFF00"), buttonCorner: 15, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FF0000"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#FF0000"), backgroundImage: "bg3", isHaveImage: true, buttonColor: Color(hex: "#8B0000"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 10, isInThemes: false),
    Theme(selectedColor: Color(hex: "#0000FF"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#0000FF"), backgroundImage: "bg4", isHaveImage: true, buttonColor: Color(hex: "#00FFFF"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(hex: "#008000"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#008000"), backgroundImage: "bg5", isHaveImage: true, buttonColor: Color(hex: "#90EE90"), buttonTextColor: Color(hex: "#006400"), buttonCorner: 5, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FFA500"), backgroundColor: Color(hex: "#A9A9A9"), foregroundColor: Color(hex: "#FFA500"), backgroundImage: "bg6", isHaveImage: true, buttonColor: Color(hex: "#FFA500"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 30, isInThemes: false),
    Theme(selectedColor: Color(hex: "#800080"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#800080"), backgroundImage: "bg7", isHaveImage: true, buttonColor: Color(hex: "#800080"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 15, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FFC0CB"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#FFC0CB"), backgroundImage: "bg8", isHaveImage: true, buttonColor: Color(hex: "#FFC0CB"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 25, isInThemes: false),
    Theme(selectedColor: Color(hex: "#00FFFF"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#00FFFF"), backgroundImage: "bg9", isHaveImage: true, buttonColor: Color(hex: "#00FFFF"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 10, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FFFF00"), backgroundColor: Color(hex: "#A9A9A9"), foregroundColor: Color(hex: "#FFFF00"), backgroundImage: "bg10", isHaveImage: true, buttonColor: Color(hex: "#FFFF00"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(hex: "#A52A2A"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#A52A2A"), backgroundImage: "bg11", isHaveImage: true, buttonColor: Color(hex: "#A52A2A"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 5, isInThemes: false),
    Theme(selectedColor: Color(hex: "#008080"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#008080"), backgroundImage: "bg12", isHaveImage: true, buttonColor: Color(hex: "#008080"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 30, isInThemes: false),
    Theme(selectedColor: Color(hex: "#4B0082"), backgroundColor: Color(hex: "#A9A9A9"), foregroundColor: Color(hex: "#4B0082"), backgroundImage: "bg13", isHaveImage: true, buttonColor: Color(hex: "#4B0082"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 15, isInThemes: false),
    Theme(selectedColor: Color(hex: "#800000"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#800000"), backgroundImage: "bg14", isHaveImage: false, buttonColor: Color(hex: "#800000"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 25, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FFD700"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#FFD700"), backgroundImage: "bg15", isHaveImage: true, buttonColor: Color(hex: "#FFD700"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 10, isInThemes: false),
    Theme(selectedColor: Color(hex: "#C0C0C0"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#C0C0C0"), backgroundImage: "bg16", isHaveImage: false, buttonColor: Color(hex: "#C0C0C0"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(hex: "#E6E6FA"), backgroundColor: Color(hex: "#A9A9A9"), foregroundColor: Color(hex: "#E6E6FA"), backgroundImage: "bg17", isHaveImage: true, buttonColor: Color(hex: "#E6E6FA"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 5, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FA8072"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#FA8072"), backgroundImage: "bg18", isHaveImage: false, buttonColor: Color(hex: "#FA8072"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 30, isInThemes: false),
    Theme(selectedColor: Color(hex: "#778899"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#778899"), backgroundImage: "bg19", isHaveImage: true, buttonColor: Color(hex: "#778899"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 15, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FF6347"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#FF6347"), backgroundImage: "bg20", isHaveImage: true, buttonColor: Color(hex: "#FF6347"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 25, isInThemes: false),
    Theme(selectedColor: Color(hex: "#F4A460"), backgroundColor: Color(hex: "#A9A9A9"), foregroundColor: Color(hex: "#F4A460"), backgroundImage: "bg21", isHaveImage: true, buttonColor: Color(hex: "#F4A460"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 10, isInThemes: false),
    Theme(selectedColor: Color(hex: "#DAA520"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#DAA520"), backgroundImage: "bg22", isHaveImage: false, buttonColor: Color(hex: "#DAA520"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(hex: "#B0C4DE"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#B0C4DE"), backgroundImage: "bg23", isHaveImage: true, buttonColor: Color(hex: "#B0C4DE"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 5, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FFA07A"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#FFA07A"), backgroundImage: "bg24", isHaveImage: true, buttonColor: Color(hex: "#FFA07A"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 30, isInThemes: false),
    Theme(selectedColor: Color(hex: "#4682B4"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#4682B4"), backgroundImage: "bg25", isHaveImage: false, buttonColor: Color(hex: "#4682B4"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 15, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FF4500"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#FF4500"), backgroundImage: "bg26", isHaveImage: true, buttonColor: Color(hex: "#FF4500"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 25, isInThemes: false),
    Theme(selectedColor: Color(hex: "#87CEEB"), backgroundColor: Color(hex: "#A9A9A9"), foregroundColor: Color(hex: "#87CEEB"), backgroundImage: "bg27", isHaveImage: true, buttonColor: Color(hex: "#87CEEB"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 10, isInThemes: false),
    Theme(selectedColor: Color(hex: "#6A5ACD"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#6A5ACD"), backgroundImage: "bg28", isHaveImage: true, buttonColor: Color(hex: "#6A5ACD"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(hex: "#708090"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#708090"), backgroundImage: "bg29", isHaveImage: false, buttonColor: Color(hex: "#708090"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 5, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FFDAB9"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#FFDAB9"), backgroundImage: "bg30", isHaveImage: true, buttonColor: Color(hex: "#FFDAB9"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 30, isInThemes: false),
    Theme(selectedColor: Color(hex: "#778899"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#778899"), backgroundImage: "bg31", isHaveImage: true, buttonColor: Color(hex: "#778899"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 15, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FF6347"), backgroundColor: Color(hex: "#A9A9A9"), foregroundColor: Color(hex: "#FF6347"), backgroundImage: "bg32", isHaveImage: true, buttonColor: Color(hex: "#FF6347"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 25, isInThemes: false),
    Theme(selectedColor: Color(hex: "#F4A460"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#F4A460"), backgroundImage: "bg33", isHaveImage: false, buttonColor: Color(hex: "#F4A460"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 10, isInThemes: false),
    Theme(selectedColor: Color(hex: "#DAA520"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#DAA520"), backgroundImage: "bg34", isHaveImage: true, buttonColor: Color(hex: "#DAA520"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(hex: "#B0C4DE"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#B0C4DE"), backgroundImage: "bg35", isHaveImage: true, buttonColor: Color(hex: "#B0C4DE"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 5, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FFA07A"), backgroundColor: Color(hex: "#A9A9A9"), foregroundColor: Color(hex: "#FFA07A"), backgroundImage: "bg36", isHaveImage: true, buttonColor: Color(hex: "#FFA07A"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 30, isInThemes: false),
    Theme(selectedColor: Color(hex: "#4682B4"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#4682B4"), backgroundImage: "bg37", isHaveImage: false, buttonColor: Color(hex: "#4682B4"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 15, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FF4500"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#FF4500"), backgroundImage: "bg38", isHaveImage: true, buttonColor: Color(hex: "#FF4500"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 25, isInThemes: false),
    Theme(selectedColor: Color(hex: "#87CEEB"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#87CEEB"), backgroundImage: "bg39", isHaveImage: true, buttonColor: Color(hex: "#87CEEB"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 10, isInThemes: false),
    Theme(selectedColor: Color(hex: "#6A5ACD"), backgroundColor: Color(hex: "#A9A9A9"), foregroundColor: Color(hex: "#6A5ACD"), backgroundImage: "bg40", isHaveImage: true, buttonColor: Color(hex: "#6A5ACD"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(hex: "#708090"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#708090"), backgroundImage: "bg41", isHaveImage: false, buttonColor: Color(hex: "#708090"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 5, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FFDAB9"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#FFDAB9"), backgroundImage: "bg42", isHaveImage: true, buttonColor: Color(hex: "#FFDAB9"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 30, isInThemes: false),
    Theme(selectedColor: Color(hex: "#778899"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#778899"), backgroundImage: "bg43", isHaveImage: true, buttonColor: Color(hex: "#778899"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 15, isInThemes: false),
    Theme(selectedColor: Color(hex: "#FF6347"), backgroundColor: Color(hex: "#A9A9A9"), foregroundColor: Color(hex: "#FF6347"), backgroundImage: "bg44", isHaveImage: true, buttonColor: Color(hex: "#FF6347"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 25, isInThemes: false),
    Theme(selectedColor: Color(hex: "#F4A460"), backgroundColor: Color(hex: "#000000"), foregroundColor: Color(hex: "#F4A460"), backgroundImage: "bg45", isHaveImage: false, buttonColor: Color(hex: "#F4A460"), buttonTextColor: Color(hex: "#FFFFFF"), buttonCorner: 10, isInThemes: false),
    Theme(selectedColor: Color(hex: "#DAA520"), backgroundColor: Color(hex: "#D3D3D3"), foregroundColor: Color(hex: "#DAA520"), backgroundImage: "bg46", isHaveImage: true, buttonColor: Color(hex: "#DAA520"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 20, isInThemes: false),
    Theme(selectedColor: Color(hex: "#B0C4DE"), backgroundColor: Color(hex: "#FFFFFF"), foregroundColor: Color(hex: "#B0C4DE"), backgroundImage: "bg47", isHaveImage: true, buttonColor: Color(hex: "#B0C4DE"), buttonTextColor: Color(hex: "#000000"), buttonCorner: 5, isInThemes: false),
    

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
                                  EdgeInsets(top: 40, leading: 24, bottom: 24, trailing: 24)
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
                                      VStack(spacing:0){
                                              Spacer().frame(
                                      height: 20
                                  )
                                          ForEach(themes.indices, id: \.self) { index in
                                          let theme = themes[index]
                                            ZStack{

                                                    HStack{
                                                    Rectangle()
                                                        .fill(theme.selectedColor.opacity(0.0))
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
                    keyboardWidth: UIScreen.main.bounds.width - 20,
                    isInthemes: theme.isInThemes
                )
                .frame(height: 210)
                .cornerRadius(10)
                .padding(
                    EdgeInsets(top:0,leading:0,bottom:0,trailing:0)
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
                                                    EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
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



extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


#Preview {
    ThemesView()
}
