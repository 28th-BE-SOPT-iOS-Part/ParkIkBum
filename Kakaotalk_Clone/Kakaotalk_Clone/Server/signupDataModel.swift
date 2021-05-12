import Foundation

// MARK: - LoginDataModel
struct signupDataModel: Codable {
    let success: Bool
    let message: String
    let data: SignupData?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
    
    init(from decoder : Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(SignupData.self, forKey: .data)) ?? nil
    }
}

// MARK: - SignupData
struct SignupData: Codable {
    let userID: Int
    let userPW: Int
    let sex: Int
    let phone : Int
    let birth : Int
    let userNickname, token: String

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case userNickname = "user_nickname"
        case userPW = "password"
        case sex = "sex"
        case phone = "phone"
        case birth = "birth"
        case token
    }
}
