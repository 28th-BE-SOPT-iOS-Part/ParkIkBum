import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var profileMessage: UILabel!
    
    static let identifier : String = "FriendsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(imageName : String, Name: String, message: String){
        if let userImage = UIImage(named: imageName){
            profileImage.image = userImage
        }
        userName.text = Name
        profileMessage.text = message
    }
    

}
