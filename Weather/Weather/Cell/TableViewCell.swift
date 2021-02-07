//
//  TableViewCell.swift
//  Weather
//
//  Created by Михаил Чертов on 07.02.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let nib = UINib(nibName: "TableViewCell", bundle: nil)
    static let reuseId = "TableViewCell"

    @IBOutlet weak var name: UILabel! {
        didSet {
            self.name.textColor = UIColor.yellow
        }
    }
    @IBOutlet weak var emblem: UIImageView! {
        didSet {
            self.emblem.layer.borderColor = UIColor.white.cgColor
            self.emblem.layer.borderWidth = 2
        }
    }
    
    func configure(city: String, emblem: UIImage) {
        self.name.text = city
        self.emblem.image = emblem
        self.backgroundColor = UIColor.black
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.name.text = nil
        self.emblem.image = nil
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        emblem.clipsToBounds = true
        emblem.layer.cornerRadius = emblem.frame.width / 2
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
