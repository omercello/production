//
//  LoginVC.swift
//  com.couples
//
//  Created by Ömer Çel on 03/01/2017.
//  Copyright © 2017 Ömer Çel. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var name: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: UIButton) {
        if pass.text!.isEmpty || name.text!.isEmpty {
            
            
            
            name.attributedPlaceholder = NSAttributedString(string: "name",attributes:[NSForegroundColorAttributeName: UIColor.red])
            pass.attributedPlaceholder = NSAttributedString(string: "pass",attributes:[NSForegroundColorAttributeName: UIColor.red])
        }else{
            //Connect Database and retrieve data
            
            
            
            
            
        }
        
    }

}
    
    

