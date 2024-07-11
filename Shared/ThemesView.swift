//
//  ThemesView.swift
//  BUTTERFLY-EFFECT
//
//  Created by fagri marouane on 11/7/2024.
//

import SwiftUI

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
                                      VStack{
                                              Spacer().frame(
                                      height: 20
                                  )
                                          ForEach(0..<10){ index in
                                            ZStack{
                                                    HStack{
                                                    Rectangle()
                                                        .fill(Color(hex: 0x7cb2fd))
                                                        .frame(width: inGeometry.size.width - 20 , height: 150)
                                                        .cornerRadius(10)
                                                }.rotation3DEffect(Angle(degrees: (index % 2 != 0) ? 1 : -1), axis: (x: 0, y: 0, z: 1))
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
                                                          //add checkmark
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
                                              }.frame(width: inGeometry.size.width, height: 170)
                                            //   .background(Color.white.opacity(0.4))
                                              .padding(
                                                    EdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
                                              )
                                            
                                          }
                                           Spacer().frame(
                                      height: 100
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

#Preview {
    ThemesView()
}
