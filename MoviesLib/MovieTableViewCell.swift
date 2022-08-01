//
//  MovieTableViewCell.swift
//  MoviesLib
//
//  Created by Juliano Costa Silva on 31/07/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var ImageViewPoater: UIImageView!
    @IBOutlet weak var LabelTitle: UILabel!
    @IBOutlet weak var LabelSummary: UILabel!
    @IBOutlet weak var LabelRating: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
