//
//  BackTableVC.swift
//  Testing
//
//  Created by Fahmi Salman Nurfikri on 4/2/17.
//  Copyright © 2017 Fahmi Salman Nurfikri. All rights reserved.
//

import Foundation

class BackTableVC: UITableViewController {
    
    var tableArray = [String]()
    
    override func viewDidLoad() {
        tableArray = ["Hello", "Second", "World"]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.textLabel?.text = tableArray[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destVC = segue.destination as! ViewController
        
        var indexPath : IndexPath = self.tableView.indexPathForSelectedRow!
        
        destVC.varView = indexPath.row
    }
}
