//
//  MyCitiesViewController.swift
//  Weather
//
//  Created by Михаил Чертов on 07.02.2021.
//

import UIKit

class MyCitiesViewController: UIViewController {
    
    //MARK: - Variable
    
    var myCities = [String]()
    
    //MARK: - Outlet
   
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    
    //MARK: - LiveCicle

    override func viewDidLoad() {
        super.viewDidLoad()
        

        tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.reuseId)
        
    }
    
    // MARK: - Navigation
    
    @IBAction func unwindToAddCity(_ unwindSegue: UIStoryboardSegue) {
        if unwindSegue.identifier == "addCity" {
            guard let allCitiesController = unwindSegue.source as? AllCitiesViewController else { return }
            if let indexPath = allCitiesController.tableView.indexPathForSelectedRow {
                let city = allCitiesController.cities[indexPath.row]
                if !myCities.contains(city.title) {
                    myCities.append(city.title)
                    tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "Weather", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let controller = segue.destination as? WeatherViewController,
            let indexPath = tableView.indexPathForSelectedRow
        {
            controller.city = myCities[indexPath.row]
        }
    }
}

//MARK: - TableViewDataSource

extension MyCitiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as! TableViewCell
        let city = myCities[indexPath.row]
        cell.name.text = city
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myCities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

//MARK: - TableViewDelegate

extension MyCitiesViewController: UITableViewDelegate { }
