//
//  SecondViewController.swift
//  CatchTheKennyGame
//
//  Created by Vitalen Holding on 15.12.2021.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var highScoreLabel: UILabel!
    var highScore = 0
    override func viewDidLoad() {
        super.viewDidLoad()
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
