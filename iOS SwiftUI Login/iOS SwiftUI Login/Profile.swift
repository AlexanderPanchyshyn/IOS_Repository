import JWTDecode


struct Profile {
  
  let id: String
  let name: String
  let email: String
  let emailVerified: String
  let picture: String
  let updatedAt: String

}


extension Profile {
  
  static var empty: Self {
    return Profile(
      id: "",
      name: "",
      email: "",
      emailVerified: "",
      picture: "",
      updatedAt: ""
    )
  }
  
    static func from(_ idToken: String) -> Self {
        guard
            let jwt = try? decode(jwt: idToken),
            let id = jwt.subject,
            let name = jwt.claim(name: "name").string,
            let email = jwt.claim(name: "email").string,
            let emailVerified = jwt.claim(name: "emailVerified").string,
            let picture = jwt.claim(name: "picture").string,
            let updatedAt = jwt.claim(name: "updatedAt").string
        else {
            return .empty
        }
        
        return Profile(
            id: id,
            name: name,
            email: email,
            emailVerified: emailVerified,
            picture: picture,
            updatedAt: updatedAt
          )
    }
}
