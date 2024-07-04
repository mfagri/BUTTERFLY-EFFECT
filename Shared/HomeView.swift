import SwiftUI
import UIKit
struct HomeView: View {
    @State private var selectedTab = 0
    init() {
    UITabBar.appearance().backgroundColor =  UIColor(Color.black)
    UITabBar.appearance().barTintColor = UIColor(Color.black)
    UITabBar.appearance().tintColor = UIColor(Color.red)
    UITabBar.appearance().unselectedItemTintColor = UIColor.white
    UITabBar.appearance().isTranslucent = false
    UITabBar.appearance().layer.borderWidth = 0.0
}
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    TabView(selection: $selectedTab) {                   
                        HomeTabView()
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Home")
                            }
                            .tag(0)

                        ProfileView()
                            .tabItem {
                                Image(systemName: "person")
                                Text("Profile")
                            }
                            .tag(1)
                        SettingView()
                            .tabItem {
                                Image(systemName: "gear")
                                Text("Setting")
                            }
                            .tag(2)
                    }.accentColor(.red)  
                }
            }
        }
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

struct HomeTabView: View {
    var body: some View {
        Text("Home View")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile View")
    }
}

struct SettingView: View {
    var body: some View {
        Text("Setting View")
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
