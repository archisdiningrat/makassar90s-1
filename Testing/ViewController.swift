//
//  ViewController.swift
//  Testing
//
//  Created by Fahmi Salman Nurfikri on 4/2/17.
//  Copyright © 2017 Fahmi Salman Nurfikri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    final let urlString = "http://makassar90s.com/api/schedule/date/2017-06-24?key=jongceleb3s80700"

    @IBOutlet var tableView: UITableView!
    
    var bandArray = [String]()
    var imgURLArray = [String]()
    var stageArray = [String]()
    var dateArray = [String]()
    
    
    @IBOutlet var open: UIBarButtonItem!
    
    var varView = Int()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        open.target = self.revealViewController()
        open.action = #selector(SWRevealViewController.revealToggle(_:))
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.downloadJsonWithURL()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
                            if let name = dataDict.value(forKey: "band") {
                                self.bandArray.append(name as! String)
                            }
                            if let name = dataDict.value(forKey: "img_url") {
                                self.imgURLArray.append(name as! String)
                            }
                            if let name = dataDict.value(forKey: "stage") {
                                self.stageArray.append(name as! String)
                            }
                            if let name = dataDict.value(forKey: "date") {
                                self.dateArray.append(name as! String)
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
            
//            print(jsonData)
            
        }).resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print (bandArray.count)
        return bandArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
//        print (self.bandArray)
//        print (bandArray[indexPath.row])
        cell.bandLabel.text = bandArray[indexPath.row]
        cell.dateLabel.text = dateArray[indexPath.row]
        cell.stageLabel.text = stageArray[indexPath.row]
        let imgURL = NSURL(string: imgURLArray[indexPath.row])
        if imgURL != nil {
            let data = NSData(contentsOf: (imgURL as? URL)!)
            cell.imgView.image = UIImage(data: data as! Data)
        }
        return cell
        
    }


}

