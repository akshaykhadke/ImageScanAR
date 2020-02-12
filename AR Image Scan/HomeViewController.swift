
//
//  HomeViewController.swift
//   AR
//
//  Created by MacBook003 on 28/12/18.
//  Copyright © 2018 MacBook003. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goAgainBtnClicked(_ sender: Any) {
        
        if #available(iOS 11.311.3, *) {
            let ARScanVC = self.storyboard?.instantiateViewController(withIdentifier: "ScanViewController") as! ScanViewController
            
            self.navigationController?.pushViewController(ARScanVC, animated: true)
            
        }
    }
    
    @IBAction func doneBtnClicked(_ sender: Any) {
        
        let ARSplashVC = self.storyboard?.instantiateViewController(withIdentifier: "ARSplashViewController") as! ARSplashViewController
        
        self.navigationController?.pushViewController(ARSplashVC, animated: true)
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
