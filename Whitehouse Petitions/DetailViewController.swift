//
//  DetailViewController.swift
//  Whitehouse Petitions
//
//  Created by Nikita  on 6/13/22.
//

import UIKit
import WebKit
class DetailViewController: UIViewController {

    var detailItem: Petition?
   
    @IBOutlet var scrollView: UIScrollView!
    
    
    @IBOutlet var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText.text = detailItem?.body
        scrollView.addSubview(labelText)
        
        
      

   

    }
}
