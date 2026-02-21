import View
import SwiftUI

struct HomeView: View {
    var body: some View {
        AgeView(age: 10, name: "hi")
    }
    
    #View("AgeView", values:
            .value("age", type: Int.self),
          .value("name", type: String.self),
    ) {
        Text("Hello, World")
    }
}

#Preview {
    HomeView()
}
