//
//  TextViewController.swift
//  orange_fruits_ios_programming
//
//  Created by mac on 12/15/17.
//  Copyright © 2017 Thien Tran. All rights reserved.
//

import UIKit

class TextViewController: UIViewController, UITextViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "UIKit - TextView - Swift"
        
        view.backgroundColor = .white
        
        setupView()
    }
    
    let textView : UITextView = {
        let textView = UITextView()
        
        textView.backgroundColor = UIColor(red: 220/255, green: 223/255, blue: 229/255  , alpha: 1)
        
//        textView.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
        textView.textColor = .black
        textView.textAlignment = .justified
        textView.font = UIFont(name: "AppleSDGothicNeo-Thin ", size: 15)
        
        textView.isEditable  = true
        textView.isScrollEnabled = true
        textView.isUserInteractionEnabled = true
        textView.showsVerticalScrollIndicator = true
        textView.showsHorizontalScrollIndicator = true
        
        return textView
    }()
    
    func setupView() {
        
        view.addSubview(textView)
        textView.frame = CGRect(x: 10, y: 100, width: view.bounds.width  - 10 * 2 ,height: 80)
        textView.delegate = self
    }
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        print("1 textViewShouldBeginEditing")
        
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("2 textViewDidBeginEditing")
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("3 textViewDidChange")
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("4 textView")
        
        print("text: \(text)")
        
        if text == "\n" {
            textView.resignFirstResponder()
            
            return true
        }
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        print("5 textViewShouldEndEditing")
        
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("6 textViewDidEndEditing")
    }
}
