import View
import SwiftUI

struct HomeView: View {
    var body: some View {
        ItemView(user: User(name: "Till"))
    }
    
    #View("ItemView", values: .value("user", type: User.self)) { user in
        VStack {
            Text(user.name)
        }
    }
}

class User: Codable {
    var name: String
    var birthday: Date
    
    init(name: String) {
        self.name = name
        self.birthday = Date()
    }
}
