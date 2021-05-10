import Foundation

struct LoginDataModel:Codable {
    let status : Int
    let success : Bool
    let message : String
    let data : Person
}

struct Person : Codable {
    let name, profileMessage: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileMessage = "profile_message"
    }
}
