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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestTapped(self)
    }

    @IBAction func requestTapped(sender: AnyObject) {
        var url = urlTxt.text != nil && urlTxt.text != "" ? urlTxt.text! : "http://swapi.co/api/people/1/"
        dataLbl.text = ""
        
        //overwriting url to parse data
        url = "http://swapi.co/api/people/1/"
        
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
                
                if let jsonDict = json as? [String: AnyObject] {
                
                    if let name = jsonDict["name"] as? String {
                        let parsedClass = ClassToParseData(name: name)
                        
                        print(parsedClass.name)
                    }
                }
                
            } catch {
                self.dataLbl.text = "could not read data"
                return
            }
        }.resume()
        
        self.dataLbl.text = "see console"
    }

}

