//
//  SettingViewController.swift
//  Kakaotalk_Clone
//
//  Created by 박익범 on 2021/05/07.
//

import UIKit

class SettingViewController: UIViewController {
    
    private var settingList : [SettingDataModel] = []

    @IBOutlet weak var settingCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingCollectionView.delegate = self
        settingCollectionView.dataSource = self
        setSettingData()

        // Do any additional setup after loading the view.
    }
    
    func setSettingData(){
        settingList.append(contentsOf: [SettingDataModel(imageName: "messageTabIcon", name: "메일"), SettingDataModel(imageName: "messageTabIcon", name: "캘린더"),SettingDataModel(imageName: "messageTabIcon", name: "서랍"), SettingDataModel(imageName: "messageTabIcon", name: "카카오콘"),SettingDataModel(imageName: "messageTabIcon", name: "메이커스"), SettingDataModel(imageName: "messageTabIcon", name: "선물하기"),SettingDataModel(imageName: "messageTabIcon", name: "이모티콘"),SettingDataModel(imageName: "messageTabIcon", name: "프렌즈"),SettingDataModel(imageName: "messageTabIcon", name: "쇼핑하기"),SettingDataModel(imageName: "messageTabIcon", name: "스타일"),SettingDataModel(imageName: "messageTabIcon", name: "주문하기"),SettingDataModel(imageName: "messageTabIcon", name: "멜론티켓"),SettingDataModel(imageName: "messageTabIcon", name: "게임"),SettingDataModel(imageName: "messageTabIcon", name: "멜론"),SettingDataModel(imageName: "messageTabIcon", name: "헤어샵"),SettingDataModel(imageName: "messageTabIcon", name: "전체서비스")])
    }

}

extension SettingViewController : UICollectionViewDelegate{
    
}

extension SettingViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return settingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let settingCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingCollectionViewCell", for: indexPath) as? SettingCollectionViewCell else{return UICollectionViewCell()}
        
        settingCell.setData(imageName: settingList[indexPath.row].imageName, title: settingList[indexPath.row].name)
        
        return settingCell
        
    }
    
    
}

extension SettingViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (70/375)
        let cellHeight = cellWidth * (70/70)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 19
        
    }
}
