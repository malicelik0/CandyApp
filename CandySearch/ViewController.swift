//
//  ViewController.swift
//  CandySearch
//
//  Created by Mali on 15.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var myCandies = [Candy]()
    var chosenCandy : Candy?
    
    var filterData: [Candy] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let candyCane = Candy(candyName: "Candy Cane", candyImage: UIImage(named: "Cane")!)
        let caramel = Candy(candyName: "Caramel", candyImage: UIImage(named: "Caramel")!)
        let chocolateBar = Candy(candyName: "Chocolate Bar", candyImage: UIImage(named: "Chocolate")!)
        let chocolateChip = Candy(candyName: "Chocolate Chip", candyImage: UIImage(named: "Chip")!)
        let darkChocolate = Candy(candyName: "Dark Chocolate", candyImage: UIImage(named: "Dark")!)
        let gummiBear = Candy(candyName: "Gummi Bear", candyImage: UIImage(named: "Gummi")!)
        let jawBreaker = Candy(candyName: "Jaw Breaker", candyImage: UIImage(named: "Jaw")!)
        let lollipop = Candy(candyName: "Lollipop", candyImage: UIImage(named: "Lollipop")!)
        let sourChew = Candy(candyName: "Sour Chew", candyImage: UIImage(named: "Chew")!)
        
        myCandies.append(candyCane)
        myCandies.append(caramel)
        myCandies.append(chocolateBar)
        myCandies.append(chocolateChip)
        myCandies.append(darkChocolate)
        myCandies.append(gummiBear)
        myCandies.append(jawBreaker)
        myCandies.append(lollipop)
        myCandies.append(sourChew)
        
        searchBar.delegate = self
        
        filterData = myCandies
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = filterData[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenCandy = myCandies[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedCandy = chosenCandy
            //test
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filterData = []
        if searchText == ""{
            filterData = myCandies
        }
        else{
        for forCandy in myCandies {
            
            if forCandy.name.lowercased().contains(searchText.lowercased()){
                
                filterData.append(forCandy)
            }
        }
        }
        self.tableView.reloadData()
    }


}

