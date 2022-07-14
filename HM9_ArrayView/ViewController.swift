//
//  ViewController.swift
//  HM9_ArrayView
//
//  Created by Aliaksandr Hunko on 13/07/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let imageArray = ["Chelsea","Liv","ManUn","ManCity"]
    let imageView = UIImageView()
    
    var currentImage = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        imageView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        imageView.center = view.center
        imageView.image = UIImage(named: imageArray[currentImage])
        view.addSubview(imageView)
        
        let swipeLeft = UISwipeGestureRecognizer()
        swipeLeft.direction = .left
        imageView.isUserInteractionEnabled = true
        swipeLeft.addTarget(self, action: #selector(nextImage))
        imageView.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer()
        swipeRight.direction = .right
        imageView.isUserInteractionEnabled = true
        swipeRight.addTarget(self, action: #selector(pastImage))
        imageView.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func nextImage() {
        
        if currentImage == imageArray.count - 1{
            
            currentImage = 0
            
        } else {
            
            currentImage += 1
            
        }
        
        imageView.image = UIImage(named: imageArray[currentImage])
        
    }
    
    @objc func pastImage() {
        
        if currentImage == 0 {
            
            currentImage = imageArray.count - 1
            
        } else {
            
            currentImage -= 1
            
        }
        
        imageView.image = UIImage(named: imageArray[currentImage])
        
    }
}

