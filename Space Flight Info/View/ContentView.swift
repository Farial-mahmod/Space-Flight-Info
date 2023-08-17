import SwiftUI

struct ContentView : View {

// data as an object of SpaceAPI() class (built in the APIFormation.swift file)
@StateObject var data = SpaceAPI()

var body : some View{
  NavigationView{
    VStack{
      InfoView()
    }
    .environmentObject(data)
    // onAppear{} performs actions before the view appears, here we check the getData()'s functionality before the view appears
    .onAppear {
                data.getData()
                withAnimation(.easeIn(duration: 1)) {
                    opac = 1.0
                }
            }
    // contains the app's headline/title
            .navigationTitle("Space Flight Latest Info")
        }
    }
}

// preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
