    //
//  HomeViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 3/24/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit

let kScreenH = UIScreen.main.bounds.height
let kScreenW = UIScreen.main.bounds.width

class HomeViewController: UIViewController {
    
    var isLoading = true
    var home = HomePage()
    
    let categoriesCellId = "CategoriesCell"
    let promoOfferCellId = "PromoOfferCellId"
    let categoryOfferCellId = "CategoryOfferCellId"
    let brandOfferCellId = "BrandOfferCellId"
    let loadingCellId = "loadingCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = false

        self.collectionView.register(CategoriesCell.self, forCellWithReuseIdentifier: categoriesCellId)
        self.collectionView.register(CategoryOfferCell.self, forCellWithReuseIdentifier: categoryOfferCellId)
        self.collectionView.register(PromoOfferCell.self, forCellWithReuseIdentifier: promoOfferCellId)
        self.collectionView.register(CollectionViewLoadingCell.self, forCellWithReuseIdentifier: loadingCellId)
        self.collectionView.register(BrandOfferCell.self, forCellWithReuseIdentifier: brandOfferCellId)
        
        setUpNavBar()
        setUpView()
        fetchHomePageData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false

        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
  fileprivate lazy var collectionView : UICollectionView = { [unowned self] in
    
        let flowLayout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 10
        flowLayout.minimumInteritemSpacing = 0.0
        flowLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    
        collectionView.backgroundColor = .white
    
        collectionView.delegate = self
        collectionView.dataSource = self
       
        return collectionView
    }()
    
    func setUpView(){
        
        view.addSubview(collectionView)
        
        let views = [
            "v1" : collectionView,
        ]

        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-70-[v1]|", options: [], metrics: nil, views: views))
    }
    
    let titleNavBar : TitleNavBarView = {
        let navBar = TitleNavBarView()
        navBar.setTitle("Spree")
        navBar.translatesAutoresizingMaskIntoConstraints = false
        
        return navBar
    }()
    
    func setUpNavBar() {
        view.addSubview(titleNavBar)
        
        let views = ["v1" : titleNavBar]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(70)]", options: [], metrics: nil, views: views))
    }
    
}

extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (isLoading ? 1 : 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isLoading {
            return loadingCell(indexPath)
        } else {
            switch indexPath.section {
            case 0 : return categoriesCell(indexPath)
            case 1: return promoOfferCell(indexPath)
            case 2: return categoryOfferCell(indexPath)
            case 3 : return brandOfferCell(indexPath)
            default: return UICollectionViewCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isLoading {
            return CGSize(width : collectionView.bounds.width, height : collectionView.bounds.height)
        }else{
            switch indexPath.section
            {
            case 1 : return CGSize(width : collectionView.bounds.width, height : collectionView.bounds.width / 2)
            case 2 ,3: return CGSize(width : collectionView.bounds.width, height : collectionView.bounds.width / 2.25 + 45)
            default:  return CGSize(width: collectionView.bounds.width, height: 48)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: collectionView.bounds.width, height:CGFloat.leastNormalMagnitude )
        }else {
            return CGSize(width: collectionView.bounds.width, height: 10 )
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0   )
    }
    
    
    
}

extension HomeViewController {
    
    func fetchHomePageData() {
        PageApiClient.home({ home in
            self.home = home
            self.isLoading = false
            self.collectionView.reloadData()
        }, failure: { apiError in
            //self.showApiErrorAlert(apiError)
        })
    }
    
   @objc func didClickCategoryOfferViewAll(btn : UIButton){
        self.navigationController?.pushViewController(ProductsViewController(), animated: true)
    }
    
}

extension HomeViewController {
    
    func categoriesCell(_ indexPath : IndexPath) -> CategoriesCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: categoriesCellId, for: indexPath) as! CategoriesCell
        return cell
    }
    
    func promoOfferCell(_ indexPath: IndexPath) -> PromoOfferCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: promoOfferCellId, for: indexPath)as! PromoOfferCell
        let banner = home.data[HomePage.Section.promoOffers]!
        cell.configure(forBanner: banner)
        
        return cell
    }
    
    func brandOfferCell(_ indexPath: IndexPath) -> BrandOfferCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: brandOfferCellId, for: indexPath) as! BrandOfferCell
        let obj = home.data[HomePage.Section.brandOffers]!
        let banner =  BannerModel()
        banner.imageURLs = obj.imageURLs
        cell.model = banner
        return cell
    }
    
    func categoryOfferCell(_ indexPath: IndexPath) -> CategoryOfferCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryOfferCellId, for: indexPath) as! CategoryOfferCell
        let obj = home.data[HomePage.Section.categoryOffers]!
        let banner =  BannerModel()
        banner.imageURLs = obj.imageURLs
        cell.model = banner
        return cell
    }
    
    func loadingCell(_ indexPath: IndexPath) -> CollectionViewLoadingCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: loadingCellId, for: indexPath)as! CollectionViewLoadingCell
        
        return cell
    }
}
