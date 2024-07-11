import SwiftUI
import UIKit

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
            return "keyboard.chevron.compact.left"
        case .profile:
            return "person"
        case .favorites:
            return "heart"
        }
    }
}

struct MainView: View {
     @State private var selectedTab = 0
     init() {
        UIScrollView.appearance().bounces  = false
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().isHidden = true
        UITabBar.appearance().layer.borderWidth = 0.0
        UITabBar.appearance().clipsToBounds = true
    }
    var body: some View {

        ZStack(alignment: .bottom){
            TabView(selection: $selectedTab) {
                MenuView()
                    .tag(0)
                ThemesView()
                    .tag(1)
                SettingsView()
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
            .frame(height: 65)
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



//struct HomeOneView: View {
// 
//}

// struct SettingView: View {
//      @State private var bgColor = Color.white
//      @State private var selectedColor = Color.blue // Default color
//      @State private var foregroundColor = Color.white
    
//     var body: some View {
//         //keybAI settings
//         GeometryReader {
//             geometry in
//             VStack{
//                 Color.white.edgesIgnoringSafeArea(.all)
//                 .overlay(
//                    ScrollView {
//                      VStack{
//                         HStack{
//                             Text("KeYbAI Settings")
//                             .foregroundColor(.black).font(.system(size: 26, weight: .bold, design: .default))
//                             Spacer()
//                         }.padding(
//                             EdgeInsets(top: 50, leading: 24, bottom: 24, trailing: 24)
//                         )
//                         //Theme
//                         HStack{
//                             Text("Customize My Keyboard")
//                             .foregroundColor(.gray).font(.system(size: 18, weight: .bold, design: .default))
//                             Spacer()
//                         }.padding(
//                             EdgeInsets(top: 10, leading: 24, bottom: 0, trailing: 24)
//                         )
//                         //theme selection
//                            VStack {
//                                 Rectangle()
//                                     .fill(bgColor)
//                                     .frame(width: geometry.size.width - 40, height: 340)
//                                     .cornerRadius(10)
//                                     .shadow(radius: 2)
//                                     .padding(10)
                                   
//                             } .overlay(
//                                         viewkeyboard(selectedColor: selectedColor, backgroundColor: bgColor, foregroundColor: foregroundColor)
//                                             .frame(width: geometry.size.width - 40, height: 340)
//                                             .cornerRadius(10)
//                                             .padding(10)
//                                             // .overlay()
                                     
//                                     )
//                             HStack{
//                                 Text("Background")
//                                 .foregroundColor(.black).font(.system(size: 18, design: .default))
//                                 ColorPicker("", selection: $bgColor, supportsOpacity: false)
//                                 .labelsHidden()
//                                 Spacer()
//                             }.padding(
//                                 EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
//                             )
//                             HStack{
//                                 Text("Buttons Color")
//                                 .foregroundColor(.black).font(.system(size: 18, design: .default))
//                                 ColorPicker("", selection: $selectedColor, supportsOpacity: false)
//                                 .labelsHidden()
//                                 Spacer()
//                             }.padding(
//                                 EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
//                             )
//                              HStack{
//                                 Text("Foreground")
//                                 .foregroundColor(.black).font(.system(size: 18, design: .default))
//                                 ColorPicker("", selection: $foregroundColor, supportsOpacity: false)
//                                 .labelsHidden()
//                                 Spacer()
//                             }.padding(
//                                 EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
//                             )
                        
//                         // Spacer().frame(
//                         //     height: 24
//                         // )

//                     }.padding(0)
//                    }
//                 )
//             }.ignoresSafeArea()
//         }
//     }
// }


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension MainView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
        VStack(spacing: 0){
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
        .frame(width: isActive ? 100 : 60, height: 50)
        .background(isActive ? Color.purple.opacity(0.7) : Color.clear)
        .cornerRadius(30)
    }
}

