import UIKit

class FreindsProfileViewController: UIViewController {
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileState: UILabel!

    
    var userProfileName : String = ""
    var userProfileImage : String = ""
    var userProfileState : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileName.text = userProfileName
        profileImage.index(ofAccessibilityElement: userProfileImage)
        // Do any additional setup after loading the view.
    }
    
    func setData(imageName : String, Name: String, state: String){
        if let userImage = UIImage(named: imageName){
            profileImage.image = userImage
        }
        profileName.text = Name
        profileState.text = state
    }
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
