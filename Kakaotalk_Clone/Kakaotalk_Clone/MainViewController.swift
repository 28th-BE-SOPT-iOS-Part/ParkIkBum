//
//  MainViewController.swift
//  KakaoTalk
//
//  Created by 박익범 on 2021/04/04.
//

import UIKit

class MainViewController: UIViewController {
    let freindsMainStoryboard = UIStoryboard(name: "FreindsMain", bundle: nil)
    @IBOutlet weak var EmailPhoneNumber: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    var LoginEmail : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func LoginButton(_ sender: Any) {
        if EmailPhoneNumber.text != "" && PassWord.text != ""
        { self.makeRequestAlert(title: "알림",
                                message: "로그인을 하시겠습니까?",
                                okAction: { _ in
                                  self.loginAction()
                                })
        }
        }
    func loginAction()
       {
        LoginService.shared.login(email: self.EmailPhoneNumber.text!, password: self.PassWord.text!) { result in
               switch result
               {
               case .success(let message):
                   
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
    
    
    
    @IBAction func NewAccount(_ sender: Any) {
        guard let nextNA = self.storyboard?.instantiateViewController(identifier: "AcoountViewController")
                as? AcoountViewController else{return}
        self.navigationController?.pushViewController(nextNA, animated: true)
        }
    
    
}
// MARK: - MakeAlert
extension UIViewController
{
    func makeRequestAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)?,
                   cancelAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil)
    {
        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: cancelAction)
        alertViewController.addAction(cancelAction)
        

        self.present(alertViewController, animated: true, completion: completion)
    }
    
    
    func makeAlert(title : String,
                   message : String,
                   okAction : ((UIAlertAction) -> Void)? = nil,
                   completion : (() -> Void)? = nil)
    {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message,
                                                    preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
