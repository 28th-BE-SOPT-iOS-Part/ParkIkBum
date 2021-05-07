//
//  FreindsViewController.swift
//  Kakaotalk_Clone
//
//  Created by 박익범 on 2021/04/15.
//

import UIKit

class FreindsViewController: UIViewController {

    private var friendList:[FriendDataModel] = []
    @IBOutlet weak var friendsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setFreindsList()
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
        friendsTableView.separatorStyle = .none
        // Do any additional setup after loading the view.
    }
    @IBAction func settingButtonClicked(_ sender: Any) {
        let actionSheet = UIAlertController(title: .none, message: .none, preferredStyle: .actionSheet)
           actionSheet.addAction(UIAlertAction(title: "편집", style: .default, handler: {(ACTION:UIAlertAction) in
           }))
           
           actionSheet.addAction(UIAlertAction(title: "친구관리", style: .default, handler: {(ACTION:UIAlertAction) in
           }))
        actionSheet.addAction(UIAlertAction(title: "전체설정", style: .default, handler: {(ACTION:UIAlertAction) in }))
        
           actionSheet.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
           self.present(actionSheet, animated: true, completion: nil)

        
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "차단", handler: { action, view, completionHaldler in
            self.friendList.remove(at: indexPath.row)
            self.friendsTableView.reloadData()
            completionHaldler(true)
        })
        deleteAction.backgroundColor = UIColor(red: 207/255, green:98/255, blue: 58/255, alpha: 1)
        let hideAction = UIContextualAction(style: .normal, title: "숨김", handler: { action, view, completionHaldler in
            self.friendList.remove(at: indexPath.row)
            self.friendsTableView.reloadData()
            completionHaldler(true)
        })
        hideAction.backgroundColor = UIColor(red: 103/255, green: 107/255, blue: 114/255, alpha: 1)
        return UISwipeActionsConfiguration(actions: [deleteAction, hideAction])
    }

    
    @IBAction func myProfile(_ sender: Any) {
        guard let myPf = self.storyboard?.instantiateViewController(identifier: "FreindsMyProfileViewController")
                as? FreindsMyProfileViewController else{return}
            self.present(myPf, animated: true, completion: nil)
    }
    //클릭시 이동하는 메소드
    func tableView(_ tableView: UITableView,  didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
        guard let profileVC = storyboard?.instantiateViewController(identifier: "FreindsProfileViewController") as? FreindsProfileViewController else{return}
        self.present(profileVC, animated: true, completion: nil)
        profileVC.setData(imageName: friendList[indexPath.row].imageName, Name: friendList[indexPath.row].name, state: friendList[indexPath.row].state)
        
    }
    func setFreindsList(){
        friendList.append(contentsOf: [
            FriendDataModel(imageName: "profileImage1",
                            name: "안솝트",
                            state: "배고파요"),
            
            FriendDataModel(imageName: "profileImage2",
                            name: "최솝트",
                            state: "피곤해요"),
            
            FriendDataModel(imageName: "profileImage3",
                            name: "정솝트",
                            state: "시험언제끝나죠?"),
            
            FriendDataModel(imageName: "profileImage4",
                            name: "이솝트",
                            state: "ㅠㅠㅠㅠ"),
            
            FriendDataModel(imageName: "profileImage5",
                            name: "유솝트",
                            state: "나는 상태메세지!"),
            
            FriendDataModel(imageName: "profileImage6",
                            name: "박솝트",
                            state: "원하는대로 바꿔보세요 ^_^"),
            
            FriendDataModel(imageName: "profileImage7",
                            name: "최솝트",
                            state: "넘 덥다.."),
            
            FriendDataModel(imageName: "profileImage8",
                            name: "원솝트",
                            state: "배고파요"),
            
            FriendDataModel(imageName: "profileImage9",
                            name: "투솝트",
                            state: "내꿈은 대나무부자"),
            
            FriendDataModel(imageName: "profileImage10",
                            name: "권솝트",
                            state: "걱정말라구!")
        ])
    }
    
}
extension FreindsViewController : UITableViewDelegate {
    func tableView(_ tableView : UITableView, heightForRowAt indextPath: IndexPath) -> CGFloat{
        return 50
    }
}
extension FreindsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let friendsCell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath) as? FriendsTableViewCell else {return UITableViewCell() }
        
        friendsCell.setData(imageName: friendList[indexPath.row].imageName, Name: friendList[indexPath.row].name, message:friendList[indexPath.row].state)
        return friendsCell
    }
    
            }
    

