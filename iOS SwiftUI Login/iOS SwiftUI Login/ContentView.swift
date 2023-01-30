import SwiftUI
import Auth0

struct ContentView: View {
  
  @State private var isAuthenticated = false
  @State private var userProfile = Profile.empty
  
  var body: some View {
      
    if isAuthenticated {
      
      VStack {
        
        Text("You’re logged in!")
          .modifier(TitleStyle())
  
        UserImage(urlString: userProfile.picture)
        
        VStack {
          Text("Name: \(userProfile.name)")
          Text("Email: \(userProfile.email)")
        }
        .padding()
        
        Button("Log out") {
          logout()
        }
        .buttonStyle(MyButtonStyle())
        
      }
    
    } else {
      
      VStack {
        
        Text("SwiftUI Login demo")
          .modifier(TitleStyle())
        
        Button("Log in") {
          login()
        }
        .buttonStyle(MyButtonStyle())
        
      }
      
    }
    
  }
  
  
  struct UserImage: View {
    
    var urlString: String
    
    var body: some View {
      AsyncImage(url: URL(string: urlString)) { image in
        image
          .frame(maxWidth: 128)
      } placeholder: {
        Image(systemName: "person.circle.fill")
          .resizable()
          .scaledToFit()
          .frame(maxWidth: 128)
          .foregroundColor(.blue)
          .opacity(0.5)
      }
      .padding(40)
    }
  }
  
  
  struct TitleStyle: ViewModifier {
    let titleFontBold = Font.title.weight(.bold)
    let navyBlue = Color(red: 0, green: 0, blue: 0.5)
    
    func body(content: Content) -> some View {
      content
        .font(titleFontBold)
        .foregroundColor(navyBlue)
        .padding()
    }
  }
  
  struct MyButtonStyle: ButtonStyle {
    let navyBlue = Color(red: 0, green: 0, blue: 0.5)
    
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .padding()
        .background(navyBlue)
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
  }
  
}


extension ContentView {
  
  private func login() {
    Auth0
          .webAuth()
          .start { result in
              switch result {
                case .failure(let error):
                  print("Failed with: \(error)")
                  
                case .success(let credentials):
                  self.userProfile = Profile.from(credentials.idToken)
                  self.isAuthenticated = true
                  print("Credentials: \(credentials)")
                  print("ID token: \(credentials.idToken)")
              }
          }
  }
  
  private func logout() {
      Auth0
          .webAuth()
          .clearSession { result in
              switch result {
                case .failure(let error):
                  print("Failed with: \(error)")
                  
              case .success:
                  self.isAuthenticated = false
                  self.userProfile = Profile.empty
              }
          }
  }
  
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
