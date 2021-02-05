//
//  CustomTableViewCell.swift
//  tableViewFinal
//
//  Created by Sidhant Madan on 22/01/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var cellName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

