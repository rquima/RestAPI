//
//  ViewController.swift
//  RESTConsume
//
//  Created by Raul Quispe on 9/28/15.
//  Copyright © 2015 Quima. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //https://api.parse.com/1/classes/Product
        // Do any additional setup after loading the view, typically from a nib.
        let apiKey = "lgaqGDTH1tzWG8R04pK0VpgJ7wIhZFc4hmsDo6HO"
        let restKey = "Kw7N8gRoZHGDcVI0zt2T9XFejxNNp5KQEv4wMt3F"
        let urlAPI = "https://api.parse.com/1/"
        let urlPath: String = (urlAPI + "classes/"+"Product")
        let url: NSURL = NSURL(string: urlPath)!
        let request1: NSMutableURLRequest =  NSMutableURLRequest(URL:url)
        request1.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request1.addValue(apiKey, forHTTPHeaderField: "X-Parse-Application-Id")
        request1.addValue(restKey, forHTTPHeaderField: "X-Parse-REST-API-Key")
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request1, completionHandler: { (data, response, error) -> Void in
            if error != nil {
               // println("error: \(error.localizedDescription): \(error.userInfo)")
            }
            else if data != nil {
                if let str = NSString(data: data!, encoding: NSUTF8StringEncoding) {
                    print("Received data:\n\(str)")
                }
                else {
                    print("unable to convert data to text")
                }
            }
        })
        
        task.resume()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

