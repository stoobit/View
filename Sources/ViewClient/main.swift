import View
import SwiftUI

struct HomeView: View {
    var body: some View {
        Hello()
    }
    
    #View("Hello") {
        Text("Hello, World")
    }
}

#Preview {
    HomeView()
}
