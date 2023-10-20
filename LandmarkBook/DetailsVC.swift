//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Tahir Atakan Can on 19.10.2023.
//

import UIKit

class DetailsVC: UIViewController {

   
    @IBOutlet weak var landMarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        landMarkLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
        
        
    }
    

}
