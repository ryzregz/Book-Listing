
//  Assignment IOS OOP

import UIKit

class BookCell: UITableViewCell {

    @IBOutlet weak var title:UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
