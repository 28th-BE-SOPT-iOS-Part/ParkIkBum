//
//  AcoountViewController.swift
//  KakaoTalk
//
//  Created by 박익범 on 2021/04/04.
//

import UIKit
class AcoountViewController: UIViewController {
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
        guard let nextCreate = self.storyboard?.instantiateViewController(identifier: "AccountCorrectViewController")
                as? AccountCorrectViewController else{return}
        nextCreate.UsEmail = EmailOrPhoneNumber.text
        self.present(nextCreate, animated: true, completion: nil) //다음화면으로 넘어가기
        self.navigationController?.popViewController(animated: true) // 다음화면으로넘어가면서 pop시켜버리기
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
