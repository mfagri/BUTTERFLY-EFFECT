import SwiftUI
import UIKit

//list of 4 colors



enum TabbedItems: Int, CaseIterable{
    case home = 0
    case keyboard = 1
    case profile = 2
    case favorites = 3
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .keyboard:
            return "themes"
        case .profile:
            return "Profile"
        case .favorites:
            return "Favorites"
        }

    }
    
    var iconName: String{
        switch self {
        case .home:
            return "house"
        case .keyboard:
            return "keyboard"
        case .profile:
            return "person"
        case .favorites:
            return "heart"
        }
    }
}





struct HomeView: View {
     @State private var selectedTab = 0
     init() {
        UIScrollView.appearance().bounces  = false

        // UITabBar.appearance().backgroundColor =  UIColor(Color("afe")).withAlphaComponent(0.2)
        // UITabBar.appearance().barTintColor = UIColor(Color(hex: 0x7cb2fd)).withAlphaComponent(0.2)//7cb2fd //0x7baffc
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().isHidden = true
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
    }
    var body: some View {
        //  @State var selectedTab = 0

        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                HomeOneView()
                    .tag(0)

                ThemesView()
                    .tag(1)
                ProfileView()
                    .tag(2)
                FavoriteView()
                    .tag(3)
            }.padding(
                EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            ).accentColor(Color.gray.opacity(0.5))
            ZStack{
                HStack{
                    ForEach((TabbedItems.allCases), id: \.self){ item in
                        Button{
                            selectedTab = item.rawValue
                        } label: {
                            CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                        }
                    }
                }
                .padding()
            }
            .frame(height: 70)
            .background(Color.white)
            .cornerRadius(35)
            .padding(
                EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20)
            )

        }
        .ignoresSafeArea()

    }
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}


struct ProfileView: View {
    var body: some View {
          VStack{
           LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack{
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(10)
                    Text("Profile")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    Text("This is your profile")
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(.white)
                }
            )
           
          }
          
    }
}

struct FavoriteView: View {
    var body: some View {
          VStack{
           LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack{
                    Image(systemName: "heart.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(10)
                    Text("Favorites")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    Text("This is your favorites")
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(.white)
                }
            )
           
          }
          
    }
}

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

struct HomeOneView: View {
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
                        EdgeInsets(top: 50, leading: 24, bottom: 24, trailing: 24)
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
                                            .frame(width: (geometry.size.width / 2) - 90, height: (geometry.size.width / 2) - 90)
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

struct SettingView: View {
     @State private var bgColor = Color.white
     @State private var selectedColor = Color.blue // Default color
     @State private var foregroundColor = Color.white
    
    var body: some View {
        //keybAI settings
        GeometryReader {
            geometry in
            VStack{
                Color.white.edgesIgnoringSafeArea(.all)
                .overlay(
                   ScrollView {
                     VStack{
                        HStack{
                            Text("KeYbAI Settings")
                            .foregroundColor(.black).font(.system(size: 26, weight: .bold, design: .default))
                            Spacer()
                        }.padding(
                            EdgeInsets(top: 50, leading: 24, bottom: 24, trailing: 24)
                        )
                        //Theme
                        HStack{
                            Text("Customize My Keyboard")
                            .foregroundColor(.gray).font(.system(size: 18, weight: .bold, design: .default))
                            Spacer()
                        }.padding(
                            EdgeInsets(top: 10, leading: 24, bottom: 0, trailing: 24)
                        )
                        //theme selection
                           VStack {
                                Rectangle()
                                    .fill(bgColor)
                                    .frame(width: geometry.size.width - 40, height: 340)
                                    .cornerRadius(10)
                                    .shadow(radius: 2)
                                    .padding(10)
                                   
                            } .overlay(
                                        viewkeyboard(selectedColor: selectedColor, backgroundColor: bgColor, foregroundColor: foregroundColor)
                                            .frame(width: geometry.size.width - 40, height: 340)
                                            .cornerRadius(10)
                                            .padding(10)
                                            // .overlay()
                                     
                                    )
                            HStack{
                                Text("Background")
                                .foregroundColor(.black).font(.system(size: 18, design: .default))
                                ColorPicker("", selection: $bgColor, supportsOpacity: false)
                                .labelsHidden()
                                Spacer()
                            }.padding(
                                EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                            )
                            HStack{
                                Text("Buttons Color")
                                .foregroundColor(.black).font(.system(size: 18, design: .default))
                                ColorPicker("", selection: $selectedColor, supportsOpacity: false)
                                .labelsHidden()
                                Spacer()
                            }.padding(
                                EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                            )
                             HStack{
                                Text("Foreground")
                                .foregroundColor(.black).font(.system(size: 18, design: .default))
                                ColorPicker("", selection: $foregroundColor, supportsOpacity: false)
                                .labelsHidden()
                                Spacer()
                            }.padding(
                                EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                            )
                        
                        // Spacer().frame(
                        //     height: 24
                        // )

                    }.padding(0)
                   }
                )
            }.ignoresSafeArea()
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




extension HomeView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        HStack(spacing: 10){
            Spacer()
            Image( systemName: imageName)
                .resizable()
                .renderingMode(.template)
                .foregroundColor(isActive ? .white: .black)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)

                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(isActive ? .white : .black)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? Color.purple.opacity(0.7) : Color.clear)
        .cornerRadius(30)
    }
}