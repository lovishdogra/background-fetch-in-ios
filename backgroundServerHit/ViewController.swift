//
//  ViewController.swift
//  backgroundServerHit
//
//  Created by Lovish Dogra on 07/11/17.
//  Copyright © 2017 Lovish Dogra. All rights reserved.
//  https://f2f6fe2a-2b28-48aa-bf18-691e3f307264.mock.pstmn.io//serverstatus

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    //MARK: Properties
    let state = UIApplication.shared.applicationState
    //var timer: Timer?
    
    
    //MARK: View load methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background app
        if state == .background {
            print("Background")
        } else if state == .active {
            print("Active")
        } else if state == .inactive {
            print("inactive")
        }
        
        //Alamofire
        let config = URLSessionConfiguration.background(withIdentifier: "com.lovishdogra.backgroundServerHit")
        let manager = Alamofire.SessionManager(configuration: config)
        manager.startRequestsImmediately = true
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Function to call server
    func doCall(){
        
        Alamofire.request("https://f2f6fe2a-2b28-48aa-bf18-691e3f307264.mock.pstmn.io//serverstatus").response { (response) in
            //print("Request: \(String(describing: response.request))")
            //print("Response: \(String(describing: response.response))")
            //print("Error: \(String(describing: response.error))")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Status: \(utf8Text)")
            }
        }
        print("🚀")
    }


}















































