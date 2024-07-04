import SwiftUI
import UIKit
struct HomeView: View {
    @State private var selectedTab = 0
    init() {
    UITabBar.appearance().backgroundColor =  UIColor(Color.white)
    UITabBar.appearance().barTintColor = UIColor(Color.white)
    UITabBar.appearance().tintColor = UIColor(Color.red)
    UITabBar.appearance().unselectedItemTintColor = UIColor(Color.gray).withAlphaComponent(0.6)
    UITabBar.appearance().isTranslucent = false
    UITabBar.appearance().layer.borderWidth = 0.0
    UITabBar.appearance().clipsToBounds = true
}
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    TabView(selection: $selectedTab) {                   
                        HomeTabView()
                            .tabItem {
                                Image(systemName: "house")
                                Text("Home")
                            }
                            .tag(0)

                        ProfileView()
                            .tabItem {
                                Image(systemName: "person.fill")
                                Text("Profile")
                            }
                            .tag(1)
                        SettingView()
                            .tabItem {
                                Image(systemName: "gearshape.fill")
                                Text("Setting")
                            }
                            .tag(2)
                    }.accentColor(Color.blue).opacity(0.7)  
                }
            }
        }
    }
}

struct HomeTabView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
           Color.white
           .overlay(   
            VStack{
            //wellcome to KeYbAI 
               HStack{
                 Text("Wellcome to KeYbAI")
                .foregroundColor(.black).font(.system(size: 26, weight: .bold, design: .default))
                Spacer()
               }.padding(
                EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
               )
               //How to use
                VStack{
                    Rectangle(
                    )
                        .fill(Color.gray).opacity(0.4)
                        .frame(width:geometry.size.width - 40, height: geometry.size.height/3)
                        .cornerRadius(24)
                        .padding(10).overlay(
                            VStack{
                                
                                HStack{
                                    Text("How to use")
                                    .foregroundColor(.black).font(.system(size: 16, weight: .bold, design: .default))
                                    Spacer()
                                }.padding(
                                    EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                                )
                               
                            }.padding(10)
                        )
                }
            }.padding(10)
            )
        }
        }
    }
}

struct ProfileView: View {
    var body: some View {
            Color.white
           .overlay(
            Text("a")
           )
    }
}

struct SettingView: View {
    var body: some View {
           Color.white
            .overlay(
            Text("Setting View")
            )
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
