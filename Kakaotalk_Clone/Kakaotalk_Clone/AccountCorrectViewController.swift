//
//  AccountCorrectViewController.swift
//  KakaoTalk
//
//  Created by 박익범 on 2021/04/04.
//
// 

import UIKit

class AccountCorrectViewController: UIViewController {
    @IBOutlet weak var UserEmail: UILabel!
    var UsEmail : String?
    var UsEmail2 : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EmailName()
    }
    @IBAction func Confirm(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func EmailName(){
        if let em = self.UsEmail
        {
            UserEmail.text = em
        }
        if let em2 = self.UsEmail2
        {
            UserEmail.text = em2
        }
    }
}
