//
//  AllCitiesViewController.swift
//  Weather
//
//  Created by Михаил Чертов on 07.02.2021.
//

import UIKit

class AllCitiesViewController: UIViewController {
    
    //MARK: - Variable
    
    var cities = [
        (title: "London", emblem:  UIImage(named: "london")),
        (title: "Moscow", emblem:  UIImage(named: "paris")),
        (title: "Dubai", emblem:  UIImage(named: "london")),
        (title: "New York", emblem:  UIImage(named: "new york")),
        (title: "London", emblem:  UIImage(named: "london")),
        (title: "Moscow", emblem:  UIImage(named: "paris")),
        (title: "Dubai", emblem:  UIImage(named: "london")),
        (title: "New York", emblem:  UIImage(named: "new york"))
    ]
    
    //MARK: - Outlet
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    //MARK: - Live Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.reuseId)

    }
    
    // MARK: - Navigation
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "addCity", sender: nil)
    }

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}

//MARK: - TableDataSource

extension AllCitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as! TableViewCell
        let city = self.cities[indexPath.row]
        cell.configure(city: city.title, emblem: city.emblem!)
        return cell
    }
    
    
}

//MARK: - TableViewDelegate

extension AllCitiesViewController: UITableViewDelegate { }
