//
//  Map.swift
//  Testing
//
//  Created by Fahmi Salman Nurfikri on 4/4/17.
//  Copyright © 2017 Fahmi Salman Nurfikri. All rights reserved.
//

import UIKit

class Map: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet var open: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.scroll.minimumZoomScale = 1.0
        self.scroll.maximumZoomScale = 6.0
        
        open.target = self.revealViewController()
        open.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.img
    }

}
