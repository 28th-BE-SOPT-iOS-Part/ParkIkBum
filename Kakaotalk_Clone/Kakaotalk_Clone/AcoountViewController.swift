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
        guard let nextCreate = freindsMainStoryboard.instantiateViewController(identifier: "MainTabBarController")
                as?MainTabBarController else{return}
                self.navigationController?.pushViewController(nextCreate, animated: true)
            }
            else {
                passwordNotCorrect.text = "비밀번호가 일치하지 않습니다."
            }
    
    }
        else{
            passwordNotCorrect.text = "모두 입력해주세요."
        }
    }
}
