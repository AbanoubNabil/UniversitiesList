//
//  ViewController.swift
//  UniversitiesList
//
//  Created by Abanoub Nabil on 5/3/24.
//

import UIKit
import UnivirsityDetails

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToDetails(_ sender: Any) {
        let view = DetailsViewController()
        self.present(view, animated: true)
    }
    
}

