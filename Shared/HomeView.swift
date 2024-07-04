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
     let steps = [
        ["image": "step1", "title": "Step 1:", "description": "Open the keyboard settings"],
        ["image": "step2", "title": "Step 2:", "description": "Tap on 'Keyboards'"],
        ["image": "step3", "title": "Step 3:", "description": "Tap on 'Add New Keyboard'"],
        ["image": "step4", "title": "Step 4:", "description": "Select 'Custom Keyboard'"],
        ["image": "step5", "title": "Step 5:", "description": "Select KeYbAI Keyboard"]
    ]
    var body: some View {
        GeometryReader { geometry in
            VStack{
           Color.white
           .overlay(   
            //scroll view
            ScrollView(.vertical, showsIndicators: false) {
                        VStack{
            //wellcome to KeYbAI 
               HStack{
                 Text("Wellcome to KeYbAI 👋")
                .foregroundColor(.black).font(.system(size: 26, weight: .bold, design: .default))
                Spacer()
               }.padding(
                EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
               )
               //How to use
                HStack{
                  Text("How to use 🤔")
                .foregroundColor(.black).font(.system(size: 20, weight: .bold, design: .default))
                Spacer()
                }.padding(
                EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                )

                //scroll view
               
                   
                       
                        
                           
                                   ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                         ForEach(0..<steps.count, id: \.self) { index in
                let step = steps[index]
                VStack {
                     Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: geometry.size.width - 20, height: 350)
                    .cornerRadius(10)
                    .padding(10)
                    .overlay(
                        VStack{
                            Spacer(
                                
                            ).frame(
                                height: 30
                            )
                            Image(step["image"]!)
                            .resizable()
                            .frame(width: geometry.size.width - 40, height: 250)
                            .cornerRadius(10)
                            .padding(10)
                            Text(step["title"]!)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            Text(step["description"]!)
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            Spacer()

                        }
                    )
                }
            
                    }
                    }.padding(10)
                }
                        
                    
                
                //Get Started
                HStack{
                  Text("Future updates 🚀"
                  )
                .foregroundColor(.black).font(.system(size: 20, weight: .bold, design: .default))
                Spacer()
                }.padding(
                EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                )
                //future of KeYbAI
                VStack{
                    Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: geometry.size.width - 20, height: 150)
                    .cornerRadius(10)
                    .padding(10).overlay(
                        VStack{
                            Spacer(
                                
                            ).frame(
                                height: 30
                            )
                            Text("Future updates will include:")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            HStack{
                                Image(systemName: "star").resizable().frame(width: 20, height: 20).foregroundColor(.black)
                                Text("More themes")
                                .foregroundColor(.black).font(.system(size: 16, weight: .bold, design: .default))
                            }
                            HStack{
                                Image(systemName: "star").resizable().frame(width: 20, height: 20).foregroundColor(.black)
                                Text("More languages")
                                .foregroundColor(.black).font(.system(size: 16, weight: .bold, design: .default))
                            }
                            HStack{
                                Image(systemName: "star").resizable().frame(width: 20, height: 20).foregroundColor(.black)
                                Text("More features")
                                .foregroundColor(.black).font(.system(size: 16, weight: .bold, design: .default))
                            }
                            Spacer()

                        }
                    )
                }
                //Contact us
                HStack{
                  Text("Contact us 📧"
                  )
                .foregroundColor(.black).font(.system(size: 20, weight: .bold, design: .default))
                Spacer()
                }.padding(
                EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                )
                
            }.padding(10)
            }
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
