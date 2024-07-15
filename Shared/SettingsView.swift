//
//  SettingsView.swift
//  BUTTERFLY-EFFECT
//
//  Created by fagri marouane on 11/7/2024.
//

import SwiftUI

struct SettingsView: View {
    var Languages = ["English", "French", "Spanish", "German", "Italian", "Chinese", "Japanese", "Korean", "Arabic", "Russian"]
    //selected language
    @State private var selectedLanguage = "English"
    @State private var isOn = false
    var body: some View {
          VStack{
           LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                ScrollView(showsIndicators: false){
                       VStack{
                    //text app Settings
                    HStack{
                        Text("App Settings")
                        .foregroundColor(.white).font(.system(size: 26, weight: .bold, design: .default))
                        Spacer()
                    }.padding(
                        EdgeInsets(top: 50, leading: 24, bottom: 24, trailing: 24)
                    )
                    HStack{
                        Text("Theme")
                        .foregroundColor(Color.white.opacity(0.7)).font(.system(size: 20, weight: .bold, design: .default))
                        Spacer()
                    }.padding(
                        EdgeInsets(top: 0, leading: 48, bottom: 14, trailing: 48)
                    )
                    
                      HStack{
                        Rectangle()
                            .fill(Color.black.opacity(0.15))
                            .frame(width: .infinity, height: 80)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(10).overlay(
                            HStack{
                                
                              
                                    Text("Dark Mode")
                                    .foregroundColor(Color.white).font(.system(size: 16, weight: .bold, design: .default))
                                    
                                
                                Spacer()
                                // VStack{
                                //     Text("Light Mode")
                                //     .foregroundColor(Color.yellow.opacity(0.7)).font(.system(size: 16, weight: .bold, design: .default))
                                //     Spacer()
                                //     Image(systemName: "sun.max.fill")
                                //         .resizable()
                                //         .frame(width: 30, height: 30)
                                //         .foregroundColor(Color.yellow.opacity(0.7))
                                // }.padding(
                                //     EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
                                // )
                                //toggle
                                Toggle("", isOn: $isOn)
                                    .toggleStyle(SwitchToggleStyle(tint: Color.red))
                                    .padding(
                                        EdgeInsets(top: 0, leading: 1, bottom: 0, trailing: 1)
                                    )
                                    .labelsHidden()
                                    .foregroundColor(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 15) // or any other shape you prefer
                                            .stroke(Color.white, lineWidth: 2) // Set the color and width of the border
                                    )

                                    
                                
                            }.frame(
                                maxWidth: .infinity,
                                maxHeight: 60
                            ).padding(
                                EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
                            
                            
                            )
                            )
                      }.padding(
                        EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
                      )
                    //app language
                    HStack{
                        Text("Language")
                        .foregroundColor(Color.white.opacity(0.7)).font(.system(size: 20, weight: .bold, design: .default))
                        Spacer()
                    }.padding(
                        EdgeInsets(top: 0, leading: 48, bottom: 0, trailing: 48)
                    )
                    HStack{
                        Rectangle()
                            .fill(Color.black.opacity(0.15))
                            .frame(width: .infinity, height: 80)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(10).overlay(
                            HStack{
                                //app language
                                Text("Select a language")
                                .foregroundColor(Color.white).font(.system(size: 16, weight: .bold, design: .default))
                                Spacer()
                                //dropdown
                                // DropDownMenu()
                                Menu {
                                    ForEach(Languages, id: \.self) { language in
                                        Button(action: {
                                            self.selectedLanguage = language
                                        }) {
                                            Text(language).foregroundColor(.white)
                                        }
                                    }
                                    } label: {
                                        Text(self.selectedLanguage).foregroundColor(.white)
                                    }
                                
                            }.frame(
                                maxWidth: .infinity,
                                maxHeight: 100
                            ).padding(
                                EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
                            
                            
                            )
                            )
                      }.padding(
                        EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
                      )
                    //rate & privacy & share & feedback
                    //more
                    HStack{
                        Text("More")
                        .foregroundColor(.white).font(.system(size: 26, weight: .bold, design: .default))
                        Spacer()
                    }.padding(
                        EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24)
                    )
                    //rate
                    //  HStack{
                    //     Text("Rate")
                    //     .foregroundColor(Color.white.opacity(0.7)).font(.system(size: 20, weight: .bold, design: .default))
                    //     Spacer()
                    // }.padding(
                    //     EdgeInsets(top: 0, leading: 48, bottom: 14, trailing: 48)
                    // )
                    HStack{
                        Rectangle()
                            .fill(Color.black.opacity(0.15))
                            .frame(width: .infinity, height: 80)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(10).overlay(
                            HStack{
                               
                                Text("Rate us")
                                .foregroundColor(Color.white).font(.system(size: 16, weight: .bold, design: .default))
                                Spacer()
                                // Menu {
                                //     ForEach(Languages, id: \.self) { language in
                                //         Button(action: {
                                //             self.selectedLanguage = language
                                //         }) {
                                //             Text(language).foregroundColor(.white)
                                //         }
                                //     }
                                //     } label: {
                                //         Text(self.selectedLanguage).foregroundColor(.white)
                                //     }
                                //arrow icon
                                Image(systemName: "greaterthan")
                                    .resizable()
                                    .frame(width: 15, height: 20)
                                    .foregroundColor(Color.white)
                            }.frame(
                                maxWidth: .infinity,
                                maxHeight: 100
                            ).padding(
                                EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
                            
                            
                            )
                            )
                      }.padding(
                        EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
                      )
                    HStack{
                        Rectangle()
                            .fill(Color.black.opacity(0.15))
                            .frame(width: .infinity, height: 80)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(10).overlay(
                            HStack{
                               
                                Text("Privacy")
                                .foregroundColor(Color.white).font(.system(size: 16, weight: .bold, design: .default))
                                Spacer()
                                // Menu {
                                //     ForEach(Languages, id: \.self) { language in
                                //         Button(action: {
                                //             self.selectedLanguage = language
                                //         }) {
                                //             Text(language).foregroundColor(.white)
                                //         }
                                //     }
                                //     } label: {
                                //         Text(self.selectedLanguage).foregroundColor(.white)
                                //     }
                                  Image(systemName: "greaterthan")
                                    .resizable()
                                    .frame(width: 15, height: 20)
                                    .foregroundColor(Color.white)
                                
                            }.frame(
                                maxWidth: .infinity,
                                maxHeight: 100
                            ).padding(
                                EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
                            
                            
                            )
                            )
                      }.padding(
                        EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
                      )
                    HStack{
                        Rectangle()
                            .fill(Color.black.opacity(0.15))
                            .frame(width: .infinity, height: 80)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(10).overlay(
                            HStack{
                               
                                Text("Share")
                                .foregroundColor(Color.white).font(.system(size: 16, weight: .bold, design: .default))
                                Spacer()
                                // Menu {
                                //     ForEach(Languages, id: \.self) { language in
                                //         Button(action: {
                                //             self.selectedLanguage = language
                                //         }) {
                                //             Text(language).foregroundColor(.white)
                                //         }
                                //     }
                                //     } label: {
                                //         Text(self.selectedLanguage).foregroundColor(.white)
                                //     }
                                  Image(systemName: "greaterthan")
                                    .resizable()
                                    .frame(width: 15, height: 20)
                                    .foregroundColor(Color.white)
                                
                            }.frame(
                                maxWidth: .infinity,
                                maxHeight: 100
                            ).padding(
                                EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
                            
                            
                            )
                            )
                      }.padding(
                        EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
                      )
                    //about app
                    HStack{
                        Text("About")
                        .foregroundColor(.white).font(.system(size: 26, weight: .bold, design: .default))
                        Spacer()
                    }.padding(
                        EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24)
                    )
                    //info about app
                    HStack{
                        Rectangle()
                            .fill(Color.black.opacity(0.15))
                            .frame(width: .infinity, height: 150)
                            .cornerRadius(10)
                            .shadow(radius: 1)
                            .padding(10).overlay(
                            VStack{
                                Text("KeYbAI")
                                .foregroundColor(Color.white).font(.system(size: 16, weight: .bold, design: .default))
                                Spacer().frame(
                                    height: 10
                                )
                                //more info what the app does text
                                Text("KeYbAI is a keyboard app that uses AI to predict what you want to type next. It learns from your typing habits and provides suggestions based on your typing history.")
                                    .foregroundColor(Color.white).font(.system(size: 16, weight: .regular, design: .default))
                                    .multilineTextAlignment(.leading)
                                    .padding(
                                        EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                                    )
                                    .frame(
                                        maxWidth: .infinity,
                                        alignment: .leading
                                    )
                                
                            }.frame(
                                maxWidth: .infinity,
                                maxHeight: 200
                            ).padding(
                                EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
                            
                            
                            )
                            )
                      }.padding(
                        EdgeInsets(top: 0, leading: 14, bottom: 0, trailing: 14)
                      )
                    Spacer().frame(
                        height: 100
                    )
                }
                }
            )
           
          }
          
    }
}

//#Preview {
//    SettingsView()
//}
