//
//  ViewController.swift
//  TicTacToe-template
//
//  Created by Mohammad Kiani on 2020-06-08.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gamer = 1
    var gamePosition = [0,0,0,0,0,0,0,0,0]
    var state = 0
    
    let winCombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    var playIsActive = true
    var person1 = UIImage(named: "cross")
    var person2 = UIImage(named: "nought")
    
    @IBOutlet weak var person1Score: UILabel!
    @IBOutlet weak var person2Score: UILabel!
    
    var p1Score : Int = 0
    var p2Score : Int = 0
    @IBOutlet weak var winnerLbl: UILabel!
    
  
    @IBAction func playAction(_ sender: AnyObject) {
        state = sender.tag
        if (gamePosition[sender.tag-1] == 0 && playIsActive == true) {
           gamePosition[sender.tag-1] = gamer
            
        if (gamer == 1){
            sender.setImage(UIImage(named: "cross1.jpeg"), for: UIControl.State())
            gamer = 2
        }
        else{
            sender.setImage(UIImage(named: "Nought1.png"), for: UIControl.State())
            gamer = 1
        }
    }
    
        for combination in winCombinations{
                if gamePosition[combination[0]] != 0 && gamePosition[combination[0]] == gamePosition[combination[1]] && gamePosition[combination[1]] == gamePosition[combination[2]]{
                    playIsActive = false
                    if gamePosition[combination[0]] == 1
                    {
                       print(" Cross wins")
                        winnerLbl.text = "Cross wins"
                        p1Score += 1
                        person1Score.text = "Score: \(p1Score)"
                    }
                    else{
                       print("Nought wins")
                        winnerLbl.text = "Nought wins"
                        p2Score += 1
                        person2Score.text = "Score: \(p2Score)"
                        
                    }
                   
                       
                    }
            }
        }
    //}
    

      override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    

    let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp))
    swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        becomeFirstResponder()

        
}
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            print("shaked motion performed")
            let button = view.viewWithTag(state) as! UIButton
            button.setImage(nil, for: UIControl.State())
            gamePosition[state-1] = 0
            button.isEnabled = true
            gamer-=1
        }
    }
    
    
    @objc func swipeUp(gesture: UISwipeGestureRecognizer){
       // let swipeGesture = gesture as UISwipeGestureRecognizer
            
            gamePosition = [0,0,0,0,0,0,0,0,0]
             playIsActive = true
             gamer = 1
            winnerLbl.isHidden = true
                for i in 1...9{
                    let tap = view.viewWithTag(i) as! UIButton
                    tap.setImage(nil, for: UIControl.State())
                    
                }
        }
    
    }


