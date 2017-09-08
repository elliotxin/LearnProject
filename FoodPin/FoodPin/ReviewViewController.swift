//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by elliot xin on 8/10/17.
//  Copyright © 2017 elliot xin. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var containerView: UIView!
    @IBOutlet var restaurantImaveView: UIImageView!
    @IBOutlet var closeBtn: UIButton!
    
    var restaurant:RestaurantMO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        backgroundImageView.image = UIImage(data: restaurant.image! as Data)
        restaurantImaveView.image = UIImage(data: restaurant.image! as Data)
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        let scaleTransform = CGAffineTransform.init(scaleX: 0, y: 0)
        let translateTransform = CGAffineTransform.init(translationX: 0, y: -1000)
        let combineTransform = scaleTransform.concatenating(translateTransform)
        containerView.transform = combineTransform
        
        closeBtn.transform = CGAffineTransform.init(translationX: 40, y: 0)
    }

    override func viewDidAppear(_ animated: Bool) {
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: { self.containerView.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: 1.2, animations: {
            self.closeBtn.transform = CGAffineTransform.identity
        })
    }
}
