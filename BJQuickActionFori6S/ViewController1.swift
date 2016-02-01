//
//  ViewController1.swift
//  BJQuickActionFori6S
//
//  Created by arvaan on 2/1/16.
//  Copyright © 2016 Bhoomi. All rights reserved.
//

import UIKit
let kNotificationSwitchToVC2 = "switchToVC2" as String
class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "pushToVC2Screen", name:kNotificationSwitchToVC2 , object: nil)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pushToVC2Screen(){
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc2Obj = mainStoryboard.instantiateViewControllerWithIdentifier("ViewController2") as! ViewController2
        self.navigationController?.pushViewController(vc2Obj, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
