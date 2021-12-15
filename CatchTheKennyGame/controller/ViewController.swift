//
//  ViewController.swift
//  CatchTheKennyGame
//
//  Created by Vitalen Holding on 15.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    //Variables
    var score = 0
    var timer = Timer()
    var counter = 0
    var kennyArray = [UIImageView]()
    var hideTimer = Timer()
    var highScore = 0
    
    //Views
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var kennyImage1: UIImageView!
    @IBOutlet weak var kennyImage2: UIImageView!
    @IBOutlet weak var kennyImage3: UIImageView!
    @IBOutlet weak var kennyImage4: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        kennyImage1.isUserInteractionEnabled = true
        kennyImage2.isUserInteractionEnabled = true
        kennyImage3.isUserInteractionEnabled = true
        kennyImage4.isUserInteractionEnabled = true
        
        
        scoreLabel.text = "Score: \(score)"
        
        //Highscore check
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        if storedHighScore == nil{
            highScore = 0
            highscoreLabel.text = "Highscore: \(highScore)"
            
        }
        if let newScore = storedHighScore as? Int{
            highScore = newScore
            highscoreLabel.text = "Highscore:\(highScore) "
        }
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
        
        kennyImage1.addGestureRecognizer(recognizer1)
        kennyImage2.addGestureRecognizer(recognizer2)
        kennyImage3.addGestureRecognizer(recognizer3)
        kennyImage4.addGestureRecognizer(recognizer4)
        
        kennyArray = [kennyImage1, kennyImage2, kennyImage3, kennyImage4]
        
        counter = 5
        timerLabel.text = String(counter)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        

    }
    
   @objc func hideKenny(){
        for kenny in kennyArray{
            kenny.isHidden = true
        }
        let random = Int(arc4random_uniform(UInt32(kennyArray.count - 1)))
        kennyArray[random].isHidden = false
    }
    
    @objc func countDown(){
        counter -= 1
        timerLabel.text = String(counter)
      /*  if counter == 0{
            timer.invalidate()
            hideTimer.invalidate()
            for kenny in kennyArray{
                kenny.isHidden = true
            }
            
            //HighScore
            if self.score > self.highScore{
                self.highScore = self.score
                highscoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            let alert = UIAlertController(title: "Time is up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { UIAlertAction in
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 30
                self.timerLabel.text = String(self.counter)
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
            }
            
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
        }
       */
        
        if counter == 0{
            timer.invalidate()
            hideTimer.invalidate()
            
            if self.score > self.highScore{
                self.highScore = self.score
                highscoreLabel.text = "Highscore: \(self.highScore)"
                UserDefaults.standard.set(self.highScore, forKey: "highscore")
            }
            
            performSegue(withIdentifier: "endSegue", sender: nil)
        }
    }
    
    @objc func increaseScore(){
        score+=1
        scoreLabel.text = "Score: \(score)"
    }
  
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "endSegue"{
            let destinationVC = segue.destination as! EndViewController
            destinationVC.highScore = self.highScore
        }
    }
    


}

