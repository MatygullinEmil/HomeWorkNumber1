//
//  ViewController.swift
//  HomeWorkNumber1
//
//  Created by Emil on 19.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0 {
        didSet {
            if count == 3 { count = 0}
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonPressed() {
    
        switch count {
        case 0:
            view.backgroundColor = .red
        case 1:
            view.backgroundColor = .yellow
        case 2:
            view.backgroundColor = .green
        default:
            break
        }
        count += 1
        
        }
        
    }
    

