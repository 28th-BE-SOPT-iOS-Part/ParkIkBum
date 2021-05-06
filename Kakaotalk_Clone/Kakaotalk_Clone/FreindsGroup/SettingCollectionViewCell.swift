//
//  SettingCollectionViewCell.swift
//  Kakaotalk_Clone
//
//  Created by 박익범 on 2021/05/07.
//

import UIKit

class SettingCollectionViewCell: UICollectionViewCell {
    
    var identifier : String = "SettingCollectionViewCell"
    
    
    @IBOutlet weak var settingLabel: UILabel!
    @IBOutlet weak var settingIcon: UIImageView!
    
    func setData(imageName:String, title:String){
        if let image = UIImage(named: imageName){
            settingIcon.image = image
        }
        settingLabel.text = title
    }
}
