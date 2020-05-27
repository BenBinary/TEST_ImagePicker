//
//  ViewController.swift
//  TEST_ImagePicker
//
//  Created by Benedikt Kurz on 27.05.20.
//  Copyright © 2020 Benedikt Kurz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    

  
    @IBOutlet weak var imageview: UIImageView!
    let pictureController = UIImagePickerController()
           

    override func viewDidLoad() {
       
        super.viewDidLoad()
         
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
 
    }
    
    
    
    @IBAction func start(_ sender: UIButton) {
        
        
        pictureController.delegate = self
        pictureController.allowsEditing = true
        pictureController.mediaTypes = ["public.image", "public.movie"]
        pictureController.sourceType = .photoLibrary
        
        
        
        pictureController.present(self, animated: true, completion: nil)
        
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Choose a source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            
            self.pictureController.sourceType = .camera
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            
            self.pictureController.sourceType = .photoLibrary
            self.present(self.pictureController, animated: true, completion: nil)
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
        
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
       // let image = info[info.index(forKey: .originalImage)!] as! UIImage
        
        
        
        
        
        let img = info[info.index(forKey: .originalImage)!]
        
        print(img.key)
        
        let image = img.value as! UIImage
        
        
        self.imageview.image = image
        
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    

}

