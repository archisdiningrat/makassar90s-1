//
//  Test.swift
//  Testing
//
//  Created by Fahmi Salman Nurfikri on 4/4/17.
//  Copyright © 2017 Fahmi Salman Nurfikri. All rights reserved.
//

import UIKit

class Artist: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var open: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    final let urlString = "http://makassar90s.com/api/bands?key=jongceleb3s80700"
        
    var bandArray = [String]()
    var imgURLArray = [String]()
    var descArray = [String]()
    
    override func viewDidLoad() {
        
        open.target = self.revealViewController()
        open.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.downloadJsonWithURL()


        // Do any additional setup after loading the view.
    }
    
    func downloadJsonWithURL(){
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                //                print (jsonObj!.value(forKey: "data"))
                
                if let dataArray = jsonObj!.value(forKey: "data") as? NSArray {
                    //                    print (dataArray)
                    for i in dataArray {
                        //                        print (i)
                        if let dataDict = i as? NSDictionary {
                            if let name = dataDict.value(forKey: "name") {
                                self.bandArray.append(name as! String)
                            }
                            if let name = dataDict.value(forKey: "img_url") {
                                self.imgURLArray.append(name as! String)
                            }
                            if let name = dataDict.value(forKey: "desc") {
                                self.descArray.append(name as! String)
                            }
                            
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                })
                
            }
            
        }).resume()
    }

    func downloadJsonWithTask() {
        let url = NSURL(string: urlString)
        
        var downloadTask = URLRequest(url: (url as? URL)!, cachePolicy: URLRequest.CachePolicy.reloadIgnoringCacheData, timeoutInterval: 20)
        
        downloadTask.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: downloadTask, completionHandler: {(data, response, error) -> Void in
            
            let jsonData = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            
            print(jsonData)
            
        }).resume()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        print (bandArray.count)
        return bandArray.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell3") as! TableViewCell1
        //        print (self.bandArray)
        //        print (bandArray[indexPath.row])
        cell.bandLabel.text = bandArray[indexPath.row]
        let imgURL = NSURL(string: imgURLArray[indexPath.row])
        if imgURL != nil {
            let data = NSData(contentsOf: (imgURL as? URL)!)
            cell.imgView.image = UIImage(data: data as! Data)
        }
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var selectedIdx = self.tableView.indexPathForSelectedRow
        var a : InfoS = segue.destination as! InfoS
        a.band = bandArray[(selectedIdx?.row)!]
        a.desc = descArray[(selectedIdx?.row)!]
        let imgURL = NSURL(string: imgURLArray[(selectedIdx?.row)!])
        if imgURL != nil {
            let data = NSData(contentsOf: (imgURL as? URL)!)
            a.image = UIImage(data: data as! Data)!
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        var selectedIndex = self.tableView.indexPathForSelectedRow
//        var a : InfoS = segue.destination as! InfoS
//        a.band = bandArray[(selectedIndex?.row)!]
//        a.desc = descArray[(selectedIndex?.row)!]
//        let imgURL = NSURL(string: imgURLArray[(selectedIndex?.row)!])
//        if imgURL != nil {
//            let data = NSData(contentsOf: (imgURL as? URL)!)
//            a.image = UIImage(data: data as! Data)!
//        }
        
    

}
