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
            if error == nil {
                do {
                    let anyObj = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [String:AnyObject]
                    // use anyObj here
                 //   let results:[AnyObject]() = anyObj["results"]
                    
                    if let results = anyObj["results"] as? NSArray {
                        // do something with results
                        for obj : AnyObject in results {
                            let idCategory  = obj["idCategory"]
                            let description = obj["description"]
                           // let idCategory = obj["idCategory"]
                            print("obj: \(idCategory) \(description)")
                      
                           
                        }
                    }
                    
                    
                   // print("json error: \(results)")
                } catch {
                    print("json error: \(error)")
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

