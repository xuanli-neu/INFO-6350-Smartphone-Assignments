//
//  ViewController.swift
//  CardGame
//
//  Created by XuanLi on 10/1/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var card1: UIImageView!
    @IBOutlet weak var card2: UIImageView!
    @IBOutlet weak var card3: UIImageView!
    @IBOutlet weak var card4: UIImageView!
    @IBOutlet weak var card5: UIImageView!
    @IBOutlet weak var card6: UIImageView!
    @IBOutlet weak var lblWinner: UILabel!
    
    let cardNames = ["2C", "2D", "2H", "2S", "3C", "3D", "3H", "3S", "4C", "4D", "4H", "4S", "5C", "5D", "5H", "5S", "6C", "6D", "6H", "6S", "7C", "7D", "7H", "7S", "8C", "8D", "8H", "8S", "9C", "9D", "9H", "9S", "10C", "10D", "10H", "10S", "AC", "AD", "AH", "AS", "JC", "JD", "JH", "JS", "QC", "QD", "QH", "QS", "KC", "KD", "KH", "KS"]
    
    var isWinner = false;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        rollCard()
    }

    @IBAction func playAction(_ sender: UIButton) {
        if(isWinner){
            showAlertButton()
        }else{
            rollCard()
        }
    }
    
    func rollCard(){
        let val1 = Int.random(in: 0..<52)
        let val2 = Int.random(in: 0..<52)
        let val3 = Int.random(in: 0..<52)
        let val4 = Int.random(in: 0..<52)
        let val5 = Int.random(in: 0..<52)
        let val6 = Int.random(in: 0..<52)
        
        print(val1)
        print(val2)
        print(val3)
        print(val4)
        print(val5)
        print(val6)
        
        card1.image = UIImage(named: cardNames[val1])
        card2.image = UIImage(named: cardNames[val2])
        card3.image = UIImage(named: cardNames[val3])
        card4.image = UIImage(named: cardNames[val4])
        card5.image = UIImage(named: cardNames[val5])
        card6.image = UIImage(named: cardNames[val6])
        
        isWinner = false
        
        if cardNames[val1] == "AS"{
            lblWinner.text = "The winner is player 1"
            isWinner = true
        }
        else if cardNames[val2] == "AS"{
            lblWinner.text = "The winner is player 1"
            isWinner = true
        }
        else if cardNames[val3] == "AS"{
            lblWinner.text = "The winner is player 1"
            isWinner = true
        }
        else if cardNames[val4] == "AS"{
            lblWinner.text = "The winner is player 2"
            isWinner = true
        }
        else if cardNames[val5] == "AS"{
            lblWinner.text = "The winner is player 2"
            isWinner = true
        }
        else if cardNames[val6] == "AS"{
            lblWinner.text = "The winner is player 2"
            isWinner = true
        }
        else{
            lblWinner.text = "No winner"
        }
    }
    
    func showAlertButton(){
        let alert = UIAlertController(title:"Alert", message:"Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"Yes", style: UIAlertAction.Style.default, handler:playAgain))
        alert.addAction(UIAlertAction(title:"No", style: UIAlertAction.Style.cancel, handler:nil))
        self.present(alert, animated: true, completion:nil)
    }
    
    func playAgain(action: UIAlertAction){
        rollCard();
    }
}

