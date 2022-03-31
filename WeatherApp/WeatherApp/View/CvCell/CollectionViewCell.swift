//
//  CollectionViewCell.swift
//  WeatherApp
//
//  Created by Md Hosne Mobarok on 31/3/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
