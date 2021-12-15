//
//  WelcomeViewController.swift
//  CatchTheKennyGame
//
//  Created by Vitalen Holding on 15.12.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBAction func startButton(_ sender: Any) {
        performSegue(withIdentifier: "startSegue", sender: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
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
