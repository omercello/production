//
//  ProfileVC.swift
//  com.couples
//
//  Created by Ömer Çel on 04/01/2017.
//  Copyright © 2017 Ömer Çel. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var profileimageview: UIImageView!
    
    @IBAction func retrieve_profile() {
    
        let getString : String!
        getString="userName=\(global_name!)" + "&userPass=\(global_pass!)" + "&email=\(global_email!)"
        print(getString)

        var request = URLRequest(url: URL(string: "http://localhost:8888/profile.php")!)
        request.httpMethod = "GET"

        request.httpBody = getString.data(using: .utf8)
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
           // self.extract_json_data(data!)
            DispatchQueue.main.async {
                self.profileimageview.image = UIImage(data: data)

                }
        }
        task.resume()
        

    
    }
    
 /*
    func get_json_data()
    {
        
        let url_to_request = "http://www.kaleidosblog.com/tutorial/colors.json"
        
        let url:NSURL = NSURL(string: url_to_request)!
        let session = NSURLSession.sharedSession()
        
        let request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = "GET"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        request.timeoutInterval = 10
        
        
        let task = session.dataTaskWithRequest(request) {
            (
            let data, let response, let error) in
            
            guard let _:NSData = data, let _:NSURLResponse = response  where error == nil else {
                print("error")
                return
            }
            
            self.extract_json_data(data!)
            
        }
        
        task.resume()
        
    }*/
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
