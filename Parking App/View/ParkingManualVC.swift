//
//  ParkingManualVC.swift
//  Parking App
//
//  Created by Mohit Mamtani on 2019-12-13.
//  Copyright © 2019 the flying pigs. All rights reserved.
//

import UIKit
import WebKit

class ParkingManualVC: UIViewController, WKUIDelegate{

    @IBOutlet  var webView: WKWebView!
    
    @IBOutlet  var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let htmlPath = Bundle.main.path(forResource: "website", ofType: "html")
        // Do any additional setup after loading the view.
        let url = URL(fileURLWithPath: htmlPath!)
        let request = URLRequest(url: url)
        
        self.webView.load(request)

        
    }
    
    
    override func loadView() {
        //customize or configure your web view appearance
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
