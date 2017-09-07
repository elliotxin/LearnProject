//
//  AddRestaurantController.swift
//  FoodPin
//
//  Created by elliot xin on 9/7/17.
//  Copyright © 2017 elliot xin. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            
            let chooseMenu = UIAlertController(title: nil, message: "Choose one method to get photo.", preferredStyle: .actionSheet)
            let cameraAction = UIAlertAction(title: "Take photo From Camera", style: .default, handler:{
                (action:UIAlertAction!) ->Void in
                
                if UIImagePickerController.isSourceTypeAvailable(.camera) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .camera
                    
                    self.present(imagePicker, animated: true, completion: nil)
                }
                
            })
            
            let photoAction = UIAlertAction(title: "Tabe Photo From PhtotLibaray", style: .default, handler: {
                (action:UIAlertAction) -> Void in
                
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                    let imagePicker = UIImagePickerController()
                    imagePicker.delegate = self
                    imagePicker.allowsEditing = false
                    imagePicker.sourceType = .photoLibrary
                    
                    self.present(imagePicker, animated: true, completion: nil)
                }
            })
            
            chooseMenu.addAction(cameraAction)
            chooseMenu.addAction(photoAction)
            
            present(chooseMenu, animated: true, completion: nil)
            
            
        }
    }
   
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            photoImageView.image = selectedImage
            photoImageView.contentMode = .scaleAspectFill
            photoImageView.clipsToBounds = true
        }
        
        let leadingConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: photoImageView.superview, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: photoImageView.superview, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 0)
        trailingConstraint.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: photoImageView.superview, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let bottomConstraint = NSLayoutConstraint(item: photoImageView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: photoImageView.superview, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        bottomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }

}
