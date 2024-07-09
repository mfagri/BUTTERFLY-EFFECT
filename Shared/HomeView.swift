import SwiftUI
import UIKit

//list of 4 colors



enum TabbedItems: Int, CaseIterable{
    case home = 0
    case keyboard
    case profile
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .keyboard:
            return "themes"
        case .profile:
            return "Profile"
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
        }
    }
}





struct HomeView: View {
     @State private var selectedTab = 0
     init() {
        UIScrollView.appearance().bounces  = false

        UITabBar.appearance().backgroundColor =  UIColor(Color.white.opacity(0.2)).withAlphaComponent(0.2)
        UITabBar.appearance().barTintColor = UIColor(Color.pink.opacity(0.0)).withAlphaComponent(0.2)
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
    }
    var body: some View {
        //  @State var selectedTab = 0

        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                HomeOneView()
                    .tag(0)

                FavoriteView()
                    .tag(1)
                ProfileView()
                    .tag(3)
            }.padding(
                EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
            ).accentColor(Color.purple.opacity(0.5))
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
            .background(Color.white.opacity(0.6))
            .cornerRadius(35)
            .padding(
                EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20)
            )

        }
        .ignoresSafeArea()

    }
}


struct ProfileView: View {
    var body: some View {
          VStack{
           LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
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
              LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                 VStack{
                      Image(systemName: "star.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .padding(10)
                      Text("Favorite")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .foregroundColor(.white)
                      Text("This is your favorite")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(.white)
                 }
                )
          }
        
    }
}

struct HomeOneView: View {
    var body: some View {
       VStack{
           
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                VStack{
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.white)
                        .padding(10)
                    Text("Home")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(.white)
                    Text("This is your home")
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(.white)
                }
            )
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
                .foregroundColor(isActive ? .purple: .black)
                .frame(width: 20, height: 20)
            if isActive{
                Text(title)

                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(isActive ? .purple : .black)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? Color.purple.opacity(0.4) : Color.clear)
        .cornerRadius(30)
    }
}