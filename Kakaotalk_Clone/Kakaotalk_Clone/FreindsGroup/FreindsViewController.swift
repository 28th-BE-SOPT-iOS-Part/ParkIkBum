//
//  FreindsViewController.swift
//  Kakaotalk_Clone
//
//  Created by 박익범 on 2021/04/15.
//

import UIKit

class FreindsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func myProfile(_ sender: Any) {
        guard let myPf = self.storyboard?.instantiateViewController(identifier: "FreindsMyProfileViewController")
                as? FreindsMyProfileViewController else{return}
            self.present(myPf, animated: true, completion: nil)
    }
    
}
