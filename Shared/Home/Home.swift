import SwiftUI


//home view

struct HomeView: View{
    var body: some View{
        Text("Home").navigationBarBackButtonHidden(true) 
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}