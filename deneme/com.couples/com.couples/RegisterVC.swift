//
//  ViewController.swift
//  com.couples
//
//  Created by Ömer Çel on 06/12/2016.
//  Copyright © 2016 Ömer Çel. All rights reserved.
//

import UIKit


//Bu değerler diğer classta kullanılmak için global tanımlandı
var global_name:String!
var global_email:String!
var global_pass:String!

class RegisterVC: UIViewController {
    
    @IBOutlet weak var couplenameTxt: UITextField!
    @IBOutlet weak var couplepassTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var nameTxt: UITextField!
    @IBOutlet weak var surnameTxt: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func register_click(_ sender: UIButton) {
        
        if couplenameTxt.text!.isEmpty || couplepassTxt.text!.isEmpty || emailTxt.text!.isEmpty || surnameTxt.text!.isEmpty {
            
            
            
            couplenameTxt.attributedPlaceholder = NSAttributedString(string: "couplename",attributes:[NSForegroundColorAttributeName: UIColor.red])
            couplepassTxt.attributedPlaceholder = NSAttributedString(string: "couplepass",attributes:[NSForegroundColorAttributeName: UIColor.red])
            emailTxt.attributedPlaceholder = NSAttributedString(string: "email",attributes:[NSForegroundColorAttributeName: UIColor.red])
            nameTxt.attributedPlaceholder = NSAttributedString(string: "name",attributes:[NSForegroundColorAttributeName: UIColor.red])
            surnameTxt.attributedPlaceholder = NSAttributedString(string: "surname",attributes:[NSForegroundColorAttributeName: UIColor.red])
            
        }else{
            
         
            
            
            
            global_name=nameTxt.text
            global_email=emailTxt.text
            global_pass=couplepassTxt.text
            
            var request = URLRequest(url: URL(string: "http://localhost:8888/register.php")!)
            request.httpMethod = "POST"
            
            let postString : String!
            //ünlem koymazsan optional olarak alıyordu
            postString="userName=\(nameTxt.text!)" + "&userPass=\(couplepassTxt.text!)" + "&email=\(emailTxt.text!)"
            print(postString)
            request.httpBody = postString.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(error)")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    print("response = \(response)")
                }
                
                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(responseString)")
            }
            task.resume()
            
            
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

