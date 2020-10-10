//
//  ViewController.swift
//  CardGame
//
//  Created by Maxim on 10/9/20.
//

import UIKit

class ViewController: UIViewController {
    
    let imgNames = ["2C", "2D", "2H", "2S", "3C", "3D", "3H", "3S", "4C", "4D", "4H", "4S", "5C", "5D", "5H", "5S", "6C", "6D", "6H", "6S", "7C", "7D", "7H", "7S", "8C", "8D", "8H", "8S", "9C", "9D", "9H", "9S", "10C", "10D", "10H", "10S", "AC", "AD", "AH", "AS", "JC", "JD", "JH", "JS", "QC", "QD", "QH", "QS", "KC", "KD", "KH", "KS"]
    
    @IBOutlet weak var player1Img1: UIImageView!
    
    @IBOutlet weak var player1Img2: UIImageView!
    
    @IBOutlet weak var player1Img3: UIImageView!
    
    
    @IBOutlet weak var player2Img1: UIImageView!
    
    @IBOutlet weak var player2Img2: UIImageView!
    
    @IBOutlet weak var player2Img3: UIImageView!
    
    @IBOutlet weak var lblWinner: UILabel!
    
    
    
    
    
    
    func playCards(){
        let val1 = Int.random(in: 0..<52)
        let val2 = Int.random(in: 0..<52)
        let val3 = Int.random(in: 0..<52)
        let val4 = Int.random(in: 0..<52)
        let val5 = Int.random(in: 0..<52)
        let val6 = Int.random(in: 0..<52)
        
        player1Img1.image = UIImage(named: imgNames[val1])
        player1Img2.image = UIImage(named: imgNames[val2])
        player1Img3.image = UIImage(named: imgNames[val3])
        player2Img1.image = UIImage(named: imgNames[val4])
        player2Img2.image = UIImage(named: imgNames[val5])
        player2Img3.image = UIImage(named: imgNames[val6])
        
        if imgNames[val1] == "AS" || imgNames[val2] == "AS" || imgNames[val3] == "AS"
        {lblWinner.text = "Winner is Player 1 !"
            showAlertButton()
        }
        
        else if imgNames[val4] == "AS" || imgNames[val5] == "AS" || imgNames[val6] == "AS"
        {lblWinner.text = "Winner is Player 2 !"
            showAlertButton()
        }
        
        else{lblWinner.text = "No Winner at this time"
        }
    }
    
    func showAlertButton(){
        let alertController = UIAlertController(title: "Alert", message: "Play again?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: {Action in self.again()}))
        alertController.addAction(UIAlertAction(title: "No", style: .cancel, handler: {Action in exit(0)}))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func again(){
        playCards()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playCards()
    }

    @IBAction func playGame(_ sender: UIButton) {
        playCards()
    }
    
}

