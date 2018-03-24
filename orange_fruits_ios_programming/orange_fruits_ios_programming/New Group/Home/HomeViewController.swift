//
//  HomeViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/16/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    @IBOutlet weak var navBarView: StaticNavBarView!
    @IBOutlet weak var tableView: UITableView!
    
    var isLoading = true
    var home = HomePage()
    var cachedCells = [Int: UITableViewCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        prepareTableView()
        configureNavBar()
        fetchHomePageData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    
    func prepareTableView() {
        let view = UIView()
        
        view.frame = CGRect(x: 0,
                            y: -tableView.bounds.height + 1,
                            width: tableView.bounds.width,
                            height: tableView.bounds.height)
        
        view.backgroundColor = UIColor.primary
        
        tableView.addSubview(view)
    }
    
    func configureNavBar(){
        let navBar = TitleNavBarView()
        
        navBar.setTitle("Spree")
        navBar.hideBackButton()
        
        navBarView.navBar = navBar
        navBarView.configure()
    }
    
    @objc func navigateToProducts() {
        self.performSegue(withIdentifier: "showProducts", sender: self)
    }

}

extension HomeViewController {
    
    func fetchHomePageData() {
        PageApiClient.home({ home in
            self.home = home
            self.isLoading = false
            self.tableView.reloadData()
        }, failure: { apiError in
            self.showApiErrorAlert(apiError)
        })
    }
    
}

extension HomeViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return (isLoading ? 1 : 5)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.leastNormalMagnitude
        } else {
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 1: return tableView.bounds.width / 2
        case 2: return tableView.bounds.width / 2.25 + 45.0
        case 3: return tableView.bounds.size.width + 10
        case 4: return tableView.bounds.width / 2.25 + 45.0
        default: return 44
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.layoutMargins = UIEdgeInsets.zero
        cell.separatorInset = UIEdgeInsets.zero
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isLoading {
            return TableViewLoadingCell()
        }else {
            switch indexPath.section {
            case 0:
                return categoriesCell(indexPath)
            case 1:
                return promoOfferCell(indexPath)
            case 2:
                return categoryOfferCell(indexPath)
            case 3:
                return brandOfferCell(indexPath)
            case 4:
                return newArrivalCell(indexPath)
            default:
                return UITableViewCell()
            }
        }
    }
    
    func categoriesCell(_ indexPath : IndexPath) -> CategoriesCell {
        if let cell = cachedCells[indexPath.section] as? CategoriesCell {
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as! CategoriesCell
            
            cell.configure()
            
            cachedCells[indexPath.section] = cell
            return cell
        }
    }
    
    func promoOfferCell(_ indexPath: IndexPath) -> PromoOfferCell {
        if let cell = cachedCells[indexPath.section] as? PromoOfferCell {
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PromoOfferCell", for: indexPath) as! PromoOfferCell
            let banner = home.data[HomePage.Section.promoOffers]!
            
            cell.configure(forBanner: banner)
            
            cachedCells[indexPath.section] = cell
            return cell
        }
    }
    
    func newArrivalCell(_ indexPath: IndexPath) -> NewArrivalsCell {
        if let cell = cachedCells[indexPath.section] as? NewArrivalsCell {
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewArrivalsCell", for: indexPath) as! NewArrivalsCell
            let banner = home.data[HomePage.Section.newArrivals]!
            
            cell.configure(forBanner: banner)
            
            cachedCells[indexPath.section] = cell
            return cell
        }
    }
    
    func categoryOfferCell(_ indexPath: IndexPath) -> CategoryOfferCell {
        if let cell = cachedCells[indexPath.section] as? CategoryOfferCell {
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryOfferCell", for: indexPath) as! CategoryOfferCell
            let banner = home.data[HomePage.Section.categoryOffers]!
            
            cell.configure(forBanner: banner)
            
            cachedCells[indexPath.section] = cell
            return cell
        }
    }
    
    func brandOfferCell(_ indexPath: IndexPath) -> BrandOfferCell {
        if let cell = cachedCells[indexPath.section] as? BrandOfferCell {
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BrandOfferCell", for: indexPath) as! BrandOfferCell
            let banner = home.data[HomePage.Section.brandOffers]!
            
            cell.configure(forBanner: banner)
            
            cachedCells[indexPath.section] = cell
            return cell
        }
    }
    
}
