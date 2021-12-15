//
//  EndViewController.swift
//  CatchTheKennyGame
//
//  Created by Vitalen Holding on 15.12.2021.
//

import UIKit

class EndViewController: UIViewController {
    var highScore = 0
    

    @IBOutlet weak var highScoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        highScoreLabel.text = String(highScore)
        
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
