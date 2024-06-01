//
//  UserCellTableViewCell.swift
//  FoodGolik
//
//  Created by Александр Новиков on 18.05.2024.
//

import UIKit

class UserCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    static let reuseId = "UserCellTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        settingCell()

    }
    
    func settingCell() {
        parentView.layer.cornerRadius = 10
        userImage.layer.cornerRadius = userImage.frame.width / 2
    }
    
    func configCell(_ name: String) {
        userName.text = name
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
