//
//  ARSplashViewController.swift
//  
//
//  
//

import UIKit

class ARSplashViewController: UIViewController {
    
    //MARK:- VIew life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK:- IBActions
    @IBAction func letsGoBtnClicked(_ sender: UIButton) {
        if #available(iOS 11.311.3, *) {
            let ARScanVC = self.storyboard?.instantiateViewController(withIdentifier: "ScanViewController") as! ScanViewController
            
            self.navigationController?.pushViewController(ARScanVC, animated: true)
            
        } else {
            // Fallback on earlier versions
            // self.view.makeToast("available for ios 11", duration: 2.0, position: .bottom)
        }
    }
}

