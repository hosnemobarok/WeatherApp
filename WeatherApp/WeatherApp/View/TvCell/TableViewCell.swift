//
//  TableViewCell.swift
//  WeatherApp
//
//  Created by Md Hosne Mobarok on 31/3/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var dayName: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var minimumTempF: UILabel!
    @IBOutlet weak var maximumTempF: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(data: Forecastday) {
        dayName.text = "Frist name: \(data.day)"
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
