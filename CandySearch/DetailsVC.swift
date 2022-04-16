//
//  DetailsVC.swift
//  CandySearch
//
//  Created by Mali on 16.04.2022.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var selectedCandy : Candy?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedCandy?.name
        imageView.image = selectedCandy?.image

        
    }
    



}
