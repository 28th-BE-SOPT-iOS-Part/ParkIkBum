import Foundation
import Alamofire

struct SignupService{
    static let shared = SignupService()
    
    private func makeParameter(email : String, password : String, sex : String, nickname : String, phone: String, birth : String) -> Parameters
    {
        return ["email" : email,
                "password" : password, "sex" : sex, "nickname" : nickname, "phone" : phone, "birth" : birth]
    }
    
    func signup(email : String,
               password : String,
               sex : String,
               nickname : String,
               phone: String,
               birth: String,
               completion : @escaping (NetworkResult<Any>) -> Void)
    {
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(APIConstants.signupURL,
                                     method: .post,
                                     parameters: makeParameter(email: email, password: password, sex: sex, nickname: nickname, phone: phone, birth: birth),
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        
        dataRequest.responseData { dataResponse in
            
            dump(dataResponse)
            
            switch dataResponse.result {
            case .success:
                
                
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure: completion(.pathErr)
                
            }
        }
                                            
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(signupDataModel.self, from: data)
        else { return .pathErr}
        
        switch statusCode {
            
        case 200: return .success(decodedData.message)
        case 400: return .requestErr(decodedData.message)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    

    
}
