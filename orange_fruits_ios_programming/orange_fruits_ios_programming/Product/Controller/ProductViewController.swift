//
//  ProductViewController.swift
//  orange_fruits_ios_programming
//
//  Created by Thien Tran on 4/13/18.
//  Copyright © 2018 Thien Tran. All rights reserved.
//

import UIKit
import RealmSwift

class ProductViewController: BaseViewController, UIScrollViewDelegate {
    
    let widthScreen = UIScreen.main.bounds.width
    let productID = 51
    var product : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.tabBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setConstraintForNavbar()
        setConstraintForProductInfo()
        
        fetchProduct()
        
        let realm = try! Realm()
        print(realm.configuration.fileURL)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    let navBarView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = UIColor.blue
        
        return view
    }()
    
    let backButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(#imageLiteral(resourceName: "Back"), for: .normal)
        button.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        return button
    }()
    
    let productScrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.backgroundColor = .white
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.isScrollEnabled = true
        scrollView.autoresizingMask = .flexibleHeight
        scrollView.showsHorizontalScrollIndicator = true
        scrollView.isPagingEnabled = false
        scrollView.indicatorStyle = .white
        
        return scrollView
    }()
    
    
    let descriptionProductView : ProductDescriptionView = {
        let view = ProductDescriptionView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let listImageProductsView : ImageGallery = {
        let view = ImageGallery()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let footerProductView : FooterProductView = {
        let view = FooterProductView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let topBorder = CALayer()
        topBorder.backgroundColor = UIColor.gray.cgColor
        topBorder.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 1)
        view.layer.addSublayer(topBorder)
        
        view.addToCartButton.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        return view
    }()
    
    func setConstraintForProductInfo()  {
        view.addSubview(productScrollView)
        productScrollView.addSubview(descriptionProductView)
        productScrollView.addSubview(listImageProductsView)
        view.addSubview(footerProductView)
        
        productScrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        let views = ["v1" : productScrollView,
                     "v2" : descriptionProductView,
                     "v3" : listImageProductsView,
                     "v4" : footerProductView
        ]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v4]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-60-[v1]", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v1][v4(45)]|", options: [], metrics: nil, views: views))
        productScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[v2(==v1)]", options: [], metrics: nil, views: views))
        productScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v3(==v1)]|", options: [], metrics: nil, views: views))
        productScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2]|", options: [], metrics: nil, views: views))
        productScrollView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v3(\(300))]-5-[v2]|", options: [], metrics: nil, views: views))
        
        
    }
    
    func setConstraintForNavbar()  {
        view.addSubview(navBarView)
        navBarView.addSubview(backButton)
        let views = ["v1" : navBarView, "v2": backButton]
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v1]|", options: [], metrics: nil, views: views))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v1(60)]", options: [], metrics: nil, views: views))
        navBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[v2(20)]", options: [], metrics: nil, views: views))
        navBarView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[v2(20)]-10-|", options: [], metrics: nil, views: views))
        
    }
    
    func fetchProduct(){
        ProductApiClient.product(productID, success: {
            product in
            self.product = product
            self.fillInProductDetails()
        }, failure: {error in
            NSLog("Error ----> %@", error.errorMessage())
        })
    }
    
    func fillInProductDetails() {
        var listImageUrls = [String]()
        
        if let imageURLs = product?.imageURLs {
            descriptionProductView.configure(for: product!)
            for item in  imageURLs {
                listImageUrls.append(String(item))
            }
            listImageProductsView.listImageUrls = listImageUrls
        }
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func addToCartHandle(){
        if !Order.hasCurrentOrder {
            OrdersApiClient.createOrder({
                order in Order.currentOrder = order
                self.addProductToCart()
            }, failure: { apiError in
                NSLog("Error during add to cart")
            }
            )
        }else {
            addProductToCart()
        }
        
    }
    
    func addProductToCart() {
        
        var productDic = Dictionary<String, Any>()
        var varientDic = [String: Any]()
        varientDic["name"] = product?.name
        varientDic["images"] = product?.imageURLs
        productDic["id"] = product?.id
        productDic["variant"] = varientDic
        productDic["quantity"] = 1
        productDic["price"] = product?.price ?? 0
        productDic["total"] = product?.price ?? 0
        
        CartApiClient.addLineItemMode(_data:  Order(fromDic: productDic),
                                      success: {
                                        () in
                                        let ac = UIAlertController.init(title: "Message", message: "Item has been added successfully to your cart.", preferredStyle: .alert)
                                        let okButton = UIAlertAction.init(title: "OK", style: .default, handler: {act in NSLog("Press OK button")})
                                        ac.addAction(okButton)
                                        self.present(ac, animated: true, completion: nil)
                                        self.tabBarController?.tabBar.isHidden = false
                                        self.footerProductView.isHidden = true
                                        self.refreshCartItemBadgeCount()
                                        
        },failure: {
            err in NSLog("ERROR")
        })
    }
    
    @objc func addProduct() {
        
        guard let productName = product?.name, let price = product?.price else {
            return
        }
        
        OrderService.shared.getProductInCart(productName){ data in
            if data == nil {
                let obj = OrderModel()
                obj.id = PrimaryKeyUtility.sharedInstance.generatePrimaryKey(OrderModel.self)
                obj.productName = productName
                obj.price = 120000
                obj.quantity = 1
                
                OrderService.shared.addProductToCart(obj){
                    print("Insert Successfully")
                }
                
            }else{
                
                guard var obj = data else {
                    return
                }
                
                OrderService.shared.updateQuantityProductOfCart(obj, type: .Increase){
                    print("Update Successfully")
                }
               
            }            
        }
    }
    
}
