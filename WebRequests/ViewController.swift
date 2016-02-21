//
//  ViewController.swift
//  WebRequests
//
//  Created by Jan Dammshäuser on 21.02.16.
//  Copyright © 2016 Jan Dammshäuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let SESSION = NSURLSession.sharedSession()
    
    @IBOutlet weak var urlTxt: UITextField!
    @IBOutlet weak var dataLbl: UILabel!

    @IBAction func requestTapped(sender: UIButton!) {
        let url = urlTxt.text != nil && urlTxt.text != "" ? urlTxt.text! : "http://swapi.co/api/people/1/"
        dataLbl.text = ""
        
        print(url)
        webRequest(url)
    }
    
    func webRequest(urlString: String) {
        guard let url = NSURL(string: urlString) else {
            dataLbl.text = "no valid url"
            return
        }
        
        SESSION.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            guard let data = data else {
                self.dataLbl.text = "no data"
                return
            }
            
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                print(json)
            } catch {
                self.dataLbl.text = "could not read data"
                return
            }
        }.resume()
        
        self.dataLbl.text = "see console"
    }

}

