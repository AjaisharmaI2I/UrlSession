//
//  ArticalTableViewCell.swift
//  Session
//
//  Created by Ideas2IT on 19/07/23.
//

import UIKit

class ArticalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var artcialImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
