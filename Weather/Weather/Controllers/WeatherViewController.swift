//
//  WeatherViewController.swift
//  Weather
//
//  Created by Михаил Чертов on 07.02.2021.
//

import UIKit

class WeatherViewController: UIViewController, UICollectionViewDelegateFlowLayout  {

    var city: String? 
    
    
    @IBOutlet weak var weekDayPicker: WeekDayPicker!
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = city

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    enum Layout {
        static let columns = 2
        static let cellHeight: CGFloat = 150
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let isBigCell = (indexPath.row + 1) % (Layout.columns + 1) == 0
        let width = isBigCell ? collectionView.frame.width : collectionView.frame.width / 2
        
        return CGSize(width: width, height: Layout.cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    @IBAction func weekDayPicker(_ sender: WeekDayPicker) {
        print(#function)
    }
}



extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCollectionViewCell
        cell.weather.text = "-20 C"
        cell.time.text = "7.02.2021 18:00"
        return cell
    }
}

extension WeatherViewController: UICollectionViewDelegate { }
