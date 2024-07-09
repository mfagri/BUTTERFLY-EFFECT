import SwiftUI
import Security



@available(OSX 11.0, *)
struct ContentView: View {
    @State private var selectedColor = Color.blue // Default color
    
    // Key for UserDefaults
    private let selectedColorKey = "selectedColorKey"
    //redus var
    @State private var redus : CGFloat = 24.0
    @State var isActive:Bool = false
    private let userDefaults = UserDefaults(suiteName: "group.com.BUTTERFLY-EFFECT.BUTTERFLY-EFFECT")
    
    var body: some View {
        GeometryReader { geometry in
           if !self.isActive {
             VStack {
                    HStack{
                    Rectangle(
                    )
                        .fill(Color.purple)
                        .frame(width: 100, height: 100)
                        .cornerRadius(self.redus)
                        .padding(10).overlay(
                            VStack{
                                Image(systemName: "star").resizable().frame(width: 20, height: 20).foregroundColor(Color.white)
                                Text("KeYbAI")
                                .foregroundColor(.white).font(.system(size: 16, weight: .bold, design: .default))
                                //random icon
                                HStack{
                                    Image(systemName: "star").resizable().frame(width: 35, height: 35).foregroundColor(Color.white)
                                    Image(systemName: "star").resizable().frame(width: 25, height: 25).foregroundColor(Color.white)
                                }
                            }.padding(10)
                        )
                }.padding(
                    EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                )
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient( gradient: Gradient(colors: [Color.purple,Color.blue.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
            ).ignoresSafeArea()
           }
           else{
//                HomeView()
               OnboardingView()
           }
        }
        .ignoresSafeArea()
        .onAppear {
          
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
           
                withAnimation {
                    self.isActive = true
                }
            }
        
    }
    }
    
    func saveString(_ value: String, forKey key: String) {
        userDefaults?.set(value, forKey: key)
        print("Saved string \"\(value)\" to UserDefaults with key: \(key)")
    }
    
    func loadString(forKey key: String) -> String? {
        if let savedString = userDefaults?.string(forKey: key) {
            print("Loaded string \"\(savedString)\" from UserDefaults with key: \(key)")
            return savedString
        } else {
            print("No string data found for key: \(key) in UserDefaults")
            return nil
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

