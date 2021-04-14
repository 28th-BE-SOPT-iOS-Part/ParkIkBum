//
//  MainViewController.swift
//  KakaoTalk
//
//  Created by 박익범 on 2021/04/04.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var EmailPhoneNumber: UITextField!
    @IBOutlet weak var PassWord: UITextField!
    var LoginEmail : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func LoginButton(_ sender: Any) {
        if EmailPhoneNumber.text != "" && PassWord.text != ""
        {
        guard let nextCA = self.storyboard?.instantiateViewController(identifier: "FreindsViewController")
                as? FreindsViewController else{return}
            self.navigationController?.pushViewController(nextCA, animated: true)
        }
        }
    @IBAction func NewAccount(_ sender: Any) {
        print(EmailPhoneNumber.text)
        print(PassWord.text)
        guard let nextNA = self.storyboard?.instantiateViewController(identifier: "AcoountViewController")
                as? AcoountViewController else{return}
        self.navigationController?.pushViewController(nextNA, animated: true)
        }
}
