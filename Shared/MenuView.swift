//
//  MenuView.swift
//  BUTTERFLY-EFFECT
//
//  Created by fagri marouane on 11/7/2024.
//

import SwiftUI

struct MenuView: View {
    
    init(){
        print("hello")
//        let defaults = UserDefaults(suiteName: "group.com.BUTTERFLY-EFFECT")
//        defaults?.set("555644", forKey: "userID")
//        defaults?.synchronize()
    }
    var body: some View {
           GeometryReader {
        geometry in
  
         VStack{
           
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack{
                    HStack{
                          HStack{
                        Rectangle(
                        )
                            .fill(Color.purple)
                            .frame(width: 80, height: 80)
                            .cornerRadius(20)
                            .shadow(radius: 1.5)
                            .padding(10).overlay(
                                VStack{
                                    Image(systemName: "star").resizable().frame(width: 15, height: 15).foregroundColor(Color.white)
                                    Text("KeYbAI")
                                    .foregroundColor(.white).font(.system(size: 16, weight: .bold, design: .default)).padding(0)
                                    //random icon
                                    HStack{
                                        Image(systemName: "star").resizable().frame(width: 20, height: 20).foregroundColor(Color.white)
                                        Image(systemName: "star").resizable().frame(width: 15, height: 15).foregroundColor(Color.white)
                                    }
                                }.padding(10)
                            )
                    }.padding(
                        EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                    )
                        Text("Welcome to KeYbAI")
                        .foregroundColor(.white).font(.system(size: 26, weight: .bold, design: .default))

                        Spacer()
                    }.padding(
                        EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0)
                    )

                    ///Customize Keyboard
                    HStack{
                        Text("Customize Your")
                        .foregroundColor(.white).font(.system(size: 20, weight: .bold, design: .default))
                        Spacer()
                    }.padding(
                        EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                    )
                    ////////
                    HStack{
                        Rectangle()
                            .fill(Color.black.opacity(0.15))
                            .frame(width:  geometry.size.width - 24, height:  geometry.size.height / 2.5)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(10).overlay(
                                VStack{
                                    HStack(spacing: 24){
                                    HStack{
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width:  (geometry.size.width / 2) - 90, height: (geometry.size.width / 2) - 90)
                                            .cornerRadius(10)
                                            .padding(10)
                                            .overlay(
                                                VStack{
                                                    Image(systemName: "paintbrush").resizable().frame(width: 24, height: 24).foregroundColor(Color.black)
                                                    Text("Keyboard")
                                                    .foregroundColor(.black).font(.system(size: 18, weight: .bold, design: .default))
                                                }
                                            )
                                    }.rotation3DEffect(Angle(degrees:  1), axis: (x: 0, y: 0, z: 1))
                                    HStack{
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: (geometry.size.width / 2) - 90, height: (geometry.size.width / 2) - 90)
                                            .cornerRadius(10)
                                            .padding(10)
                                            .overlay(
                                                VStack{
                                                    Image(systemName: "pencil").resizable().frame(width: 24, height: 24).foregroundColor(Color.black)
                                                    Text("Buttons")
                                                    .foregroundColor(.black).font(.system(size: 18, weight: .bold, design: .default))
                                                }
                                            )
                                    }.rotation3DEffect(Angle(degrees:  -1), axis: (x: 0, y: 0, z: 1))
                                }.padding(
                                    EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                                )
                                
                                 HStack(spacing: 24){
                                    HStack{
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: (geometry.size.width / 2) - 90, height: (geometry.size.width / 2) - 90)
                                            .cornerRadius(10)
                                            .padding(10)
                                            .overlay(
                                               VStack{
                                                    Image(systemName: "textformat.subscript").resizable().frame(width: 24, height: 24).foregroundColor(Color.black)
                                                    Text("Text")
                                                    .foregroundColor(.black).font(.system(size: 18, weight: .bold, design: .default))
                                                }
                                            )
                                    }.rotation3DEffect(Angle(degrees:  -1), axis: (x: 0, y: 0, z: 1))
                                    HStack{
                                        Rectangle()
                                            .fill(Color.white)
                                            .frame(width: (geometry.size.width / 2) - 90, height: (geometry.size.width / 2) - 90)
                                            .cornerRadius(10)
                                            .padding(10)
                                            .overlay(
                                                VStack{
                                                    Image(systemName: "message").resizable().frame(width: 24, height: 24).foregroundColor(Color.black)
                                                    Text("GPT")
                                                    .foregroundColor(.black).font(.system(size: 18, weight: .bold, design: .default))
                                                }
                                            )
                                    }.rotation3DEffect(Angle(degrees:  1), axis: (x: 0, y: 0, z: 1))
                                }.padding(
                                    EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                                
                                )
                                }
                            )
                    }
                    ////
                       HStack{
                        Text("Top Themes")
                        .foregroundColor(.white).font(.system(size: 20, weight: .bold, design: .default))
                        Spacer()
                    }.padding(
                        EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                    )
                    //theme selection
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(0..<10){ index in
                               HStack{
                        Rectangle()
                            .fill(Color.black.opacity(0.1))
                            .frame(width:  geometry.size.width - 24, height:  geometry.size.height / 6)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(10).overlay(
                                HStack(spacing: 24){
                                }.padding(
                                    EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                                
                                )
                            )
                    }
                            }
                        }
                    }
                    Spacer().frame(
                        height:  geometry.size.height / 8
                    )
                }
            )
          
      }
    
     }
    }
}

#Preview {
    MenuView()
}
