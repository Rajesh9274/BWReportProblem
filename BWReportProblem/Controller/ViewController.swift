//
//  ViewController.swift
//  IssueReport
//
//  Created by raj on 17/09/20.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {
    
    override public func viewDidLoad() {
        super.viewDidLoad()
     }
    
    
    @IBAction func btnReportIssue(_ sender: Any) {
        BWFeedback.shared.present(self, "test-project")
     }
    
}
