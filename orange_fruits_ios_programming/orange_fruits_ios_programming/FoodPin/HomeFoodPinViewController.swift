//
//  HomeFoodPinViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/4/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit


class HomeFoodPinViewController : UITableViewController{
    
    private let cellIdentifier = "Cell"
    
    var restaurants:[Restaurant] = [ Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited: false),
                                     
                                     Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Donostia", type: "Spanish", location: "London", image:
                                        
                                        "donostia.jpg", isVisited: false),
                                     
                                     Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg", isVisited: false),
                                                                           
                                     Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen.jpg", isVisited: false) ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HomeFoodPinTableViewCell
        
        let index = indexPath.row
        cell.nameLabel?.text = restaurants[index].name
        cell.locationLabel?.text = restaurants[index].location
        cell.typeLabel?.text = restaurants[index].type
        cell.thumnailImageView?.image = UIImage(named : restaurants[index].image )
        cell.accessoryType =  restaurants[indexPath.row].isVisited ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: {(action, indexPath) -> Void in
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
                
            }
        })
        shareAction.backgroundColor = UIColor(red: 48.0/255.0, green: 173.0/255.0, blue: 99.0/255.0, alpha: 1.0)
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: {(action, indexPath) -> Void in
            
            self.restaurants.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            //tableView.reloadData()
        })
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction ]
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath =  tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailFoodPinViewController
                
                destinationController.restaurantImage = restaurants[indexPath.row].image
            }
        }
    }
    
}
