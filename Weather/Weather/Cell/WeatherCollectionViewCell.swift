//
//  WeatherCollectionViewCell.swift
//  Weather
//
//  Created by Михаил Чертов on 07.02.2021.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var icone: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        shadowView.layer.shadowOffset = .zero
        shadowView.layer.shadowOpacity = 0.75
        shadowView.layer.shadowRadius = 6
        shadowView.layer.shadowColor = UIColor.red.cgColor
        shadowView.backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        shadowView.layer.shadowPath = UIBezierPath(ovalIn: shadowView.bounds).cgPath
        containerView.layer.cornerRadius = containerView.frame.width / 2
    }
    
    func updateShadowColor(isAboveZero: Bool) {
        shadowView.layer.shadowColor = isAboveZero ? UIColor.red.cgColor : UIColor.blue.cgColor
    }
}
