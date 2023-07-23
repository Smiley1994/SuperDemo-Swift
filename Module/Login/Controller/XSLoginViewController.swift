//
//  XSLoginViewController.swift
//  Pods
//
//  Created by Macrolor on 2022/2/15.
//

import UIKit
import ShadowBase

public class XSLoginViewController: UIViewController {

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ShadowBase.track(event: "openLogin", property: ["pv" : "Login", "time" : Date.timeIntervalBetween1970AndReferenceDate])
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white;
        
        // Do any additional setup after loading the view.
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
