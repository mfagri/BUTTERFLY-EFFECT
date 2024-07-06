import SwiftUI
import UIKit
struct HomeView: View {
    @State private var selectedTab = 0
    init() {
    UITabBar.appearance().backgroundColor =  UIColor(Color.black)
    UITabBar.appearance().barTintColor = UIColor(Color.blue.opacity(0.5))
    UITabBar.appearance().tintColor = UIColor(Color.black)
    UITabBar.appearance().unselectedItemTintColor = UIColor(Color.black).withAlphaComponent(0.6)
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
                    }.accentColor(Color.white)
                }
            }
        }
    }
}

struct HomeTabView: View {
     let steps = [
        ["image": "step1", "description": "Open the keyboard settings"],
        ["image": "step2", "description": "Tap on 'Keyboards'"],
        ["image": "step3", "description": "Tap on 'Add New Keyboard'"],
        ["image": "step4", "description": "Select 'Custom Keyboard'"],
        ["image": "step5", "description": "Select KeYbAI Keyboard"]
    ]
    //int 
    @State private var selectedStep = 0
    @State private var backgroundOffset: CGFloat = 0
    var body: some View {
        GeometryReader { geometry in
            VStack{
           Color.white.edgesIgnoringSafeArea(.all)
           .overlay(   
            //scroll view
            ScrollView(.vertical, showsIndicators: false ) {
                        VStack{
            //wellcome to KeYbAI 
               HStack{
                 Text("Wellcome to KeYbAI")
                .foregroundColor(.black).font(.system(size: 26, weight: .bold, design: .default))
                Spacer()
               }.padding(
                EdgeInsets(top: 50, leading: 24, bottom: 24, trailing: 24)
               )
               //How to use
                HStack{
                  Text("How to use")
                .foregroundColor(.black).font(.system(size: 18, weight: .bold, design: .default))
                Spacer()
                }.padding(
                EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                )

                //scroll view
               
                   
                ImageCarousel()
                
                           
                //                 //    ScrollView(.horizontal, showsIndicators: false) {
                //     HStack(spacing: 20) {
                //          ForEach(0..<steps.count, id: \.self) { index in
                // let step = steps[index]
                // VStack {
                //      Rectangle()
                //     .fill(Color.white)
                //     .frame(width: geometry.size.width - 40, height: 340)
                //     .cornerRadius(10)
                //     .shadow(radius: 2)
                //     .padding(10)
                   
                //     .overlay(
                //         VStack{
                //             Spacer(
                                
                //             ).frame(
                //                 height: 30
                //             )
                //             Image(step["image"]!)
                //             .resizable()
                //             .frame(width: geometry.size.width - 60, height: 240)
                //             .cornerRadius(10)
                //             .padding(10)
                //             // Text(step["title"]!)
                //             // .foregroundColor(.black)
                //             // .font(.system(size: 16, weight: .bold, design: .default))
                //             Text(step["description"]!)
                //             .foregroundColor(.black)
                //             .font(.system(size: 16, weight: .bold, design: .default))
                //             Spacer()

                //         }
                //         .padding(24)
                //     )
                   
                // }

                //     }
                //     }.offset(x: (self.backgroundOffset))
                //     .animation(.spring())
                //     .gesture(
                //         DragGesture()
                //             .onChanged { value in
                //                 self.backgroundOffset = value.translation.width
                //             }
                //             .onEnded { value in
                //                  if value.translation.width > 10 {
                //                     if self.backgroundOffset >= 0 {
                //                         self.backgroundOffset -= 1
                //                     }
                //                 } else if value.translation.width < -10 {
                //                     if self.backgroundOffset <= 4 {
                //                         self.backgroundOffset += 1
                //                     } 
                //                 }
                //             self.selectedStep = Int((self.backgroundOffset + 20) / (geometry.size.width - 40))
                //             }
                //     )

                    
                // }
                   //indicator
                    // HStack {
                    //             ForEach(0..<steps.count, id: \.self) { i in
                    //                 Circle()
                    //                     .fill(i == 0 ? Color.black : Color.gray)
                    //                     .frame(width: 8, height: 8)
                    //             }
                    // }
                    // .padding(24)
                    // .background(Color.white)     
                    
                
                //Get Started
                HStack{
                  Text("Future of KeYbAI"
                  )
                .foregroundColor(.black).font(.system(size: 18, weight: .bold, design: .default))
                Spacer()
                }.padding(
                EdgeInsets(top: 10, leading: 24, bottom: 10, trailing: 24)
                )
                //future of KeYbAI
               VStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: geometry.size.width - 40, height: 200)
                    .cornerRadius(10)
                    .overlay(
                        VStack {
                            Spacer()
                            HStack {
                                Text("- More themes")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("- Integrate with other apps")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("- More Emojis and GIFs") 
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                Spacer()
                            }
                            Spacer()
                            HStack {
                                Text("- Improve AI prediction")
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                Spacer()
                            }                 
                            Spacer()
                        }
                        .padding(24)
                    )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
                Spacer().frame(
                    height: 24
                )
            }.padding(10)
            }
            )
        }.ignoresSafeArea()
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




struct Step: Identifiable {
    let id = UUID()
    let image: String
    let description: String
}

struct ImageCarousel: View {
    private let steps: [Step] = [
        Step(image: "step1", description: "Open the keyboard settings"),
        Step(image: "step2", description: "Tap on 'Keyboards'"),
        Step(image: "step3", description: "Tap on 'Add New Keyboard'"),
        Step(image: "step4", description: "Select 'Custom Keyboard'"),
        Step(image: "step5", description: "Select KeYbAI Keyboard")
    ]
    
    var body: some View {
        TabView {
            ForEach(steps) { step in
                VStack {
                    Image(step.image)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                    
                    Text(step.description)
                        .font(.headline)
                        .padding()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        // .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250)
        
    }
}

struct ImageCarousel_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarousel()
    }
}
