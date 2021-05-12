//
//  AcoountViewController.swift
//  KakaoTalk
//
//  Created by 박익범 on 2021/04/04.
//

import UIKit
class AcoountViewController: UIViewController {
    let freindsMainStoryboard = UIStoryboard(name: "FreindsMain", bundle: nil)
    @IBOutlet weak var EmailOrPhoneNumber: UITextField!
    @IBOutlet weak var PassWordInput: UITextField!
    @IBOutlet weak var PasswordCorrect: UITextField!
    @IBOutlet weak var passwordNotCorrect: UILabel!
    var Email : String?
    var PassWord : String?
    var PassWordCor : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func CreateAccount(_ sender: Any) {
        if EmailOrPhoneNumber.text != "" && PassWordInput.text != "" && PasswordCorrect.text != ""
        {
            if PassWordInput.text == PasswordCorrect.text{
                self.signupAction()
            }
            else {
                passwordNotCorrect.text = "비밀번호가 일치하지 않습니다."
            }
    
    }
        else{
            passwordNotCorrect.text = "모두 입력해주세요."
        }
    }
    
    func signupAction()
    {
        SignupService.shared.signup(email: self.EmailOrPhoneNumber.text!, password: self.PassWordInput.text!, sex: "0", nickname: "앙뇽", phone: "0100001111", birth: "19990627"){ result in
               switch result
               {case .success(let message):
                   if let message = message as? String{
                       self.makeAlert(title: "알림",
                                      message: message)
                   }
                   
               case .requestErr(let message):
                   
                   if let message = message as? String{
                       
                       self.makeAlert(title: "알림",
                                 message: message)
                   }
               default :
                   print("ERROR")
               }
           }
       }
    
}


