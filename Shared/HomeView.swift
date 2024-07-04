import SwiftUI


//home view

struct HomeView: View{
    var body: some View{
        NavigationView{
            VStack{
                Color.blue.opacity(0.6)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 0)
                Text("Home")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}