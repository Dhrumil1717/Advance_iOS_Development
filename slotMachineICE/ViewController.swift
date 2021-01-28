//
//  ViewController.swift
//  slotMachineICE
//
//  Created by Dhrumil Malaviya on 2021-01-28.
//

import UIKit


class ViewController: UIViewController
{
   var _grapes = 0
    var _bananas = 0
    var _oranges = 0
    var _cherries = 0
    var _bars = 0
    var _bells = 0
    var _sevens = 0
    var _blanks = 0
    
    var playerMoney: Int = 100
    var winnings: Int = 10
    var jackpot: Int = 1000
    var playerBet: Int = 10

    @IBOutlet weak var _betText: UILabel!
    @IBOutlet weak var _creditsText: UILabel!
    @IBOutlet weak var _resultText: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }
    func _checkRange(value: Int, lowerBounds: Int, upperBounds: Int) -> Int
    {
                return (value >= lowerBounds && value <= upperBounds) ? value : -1
    }
    func _spinReels() -> [String]
    {
                var betLine = [" ", " ", " "]
                var outCome = [0, 0, 0]

        for spin in 0...2 {
            outCome[spin] = Int(floor((Double.random(in: 0...1) * 65) + 1))
                    switch (outCome[spin]) {
                    case _checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):  // 41.5% probability
                            betLine[spin] = "Blank"
                            _blanks += 1
                            break
                        case _checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37):  // 15.4% probability
                            betLine[spin] = "Grapes"
                            _grapes += 1
                            break
                        case  _checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46): // 13.8% probability
                            betLine[spin] = "Banana"
                             _bananas += 1
                            break
                        case  _checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54): // 12.3% probability
                            betLine[spin] = "Orange"
                             _oranges += 1
                            break
                        case  _checkRange(value: outCome[spin], lowerBounds: 54, upperBounds: 59): //  7.7% probability
                            betLine[spin] = "Cherry"
                             _cherries += 1
                            break
                        case  _checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62)://  4.6% probability
                            betLine[spin] = "Bar"
                             _bars += 1
                            break
                        case  _checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64)://  3.1% probability
                            betLine[spin] = "Bell"
                             _bells += 1
                            break
                        case  _checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65)://  1.5% probability
                            betLine[spin] = "Seven"
                             _sevens += 1
                            break
                    default:
                        _sevens += 1
                        
                    }
                }
                return betLine
            }//func spin reels
    
  func _determineWinnings()
  {
                if ( _blanks == 0) {
                    if ( _grapes == 3) {
                         winnings =  playerBet * 10
                    }
                    else if ( _bananas == 3) {
                         winnings =  playerBet * 20
                    }
                    else if ( _oranges == 3) {
                         winnings =  playerBet * 30
                    }
                    else if ( _cherries == 3) {
                         winnings =  playerBet * 40
                    }
                    else if ( _bars == 3) {
                         winnings =  playerBet * 50
                    }
                    else if ( _bells == 3) {
                         winnings =  playerBet * 75
                    }
                    else if ( _sevens == 3) {
                         winnings =  playerBet * 100
                    }
                    else if ( _grapes == 2) {
                         winnings =  playerBet * 2
                    }
                    else if ( _bananas == 2) {
                         winnings =  playerBet * 2
                    }
                    else if ( _oranges == 2) {
                         winnings =  playerBet * 3
                    }
                    else if ( _cherries == 2) {
                         winnings =  playerBet * 4
                    }
                    else if ( _bars == 2) {
                         winnings =  playerBet * 5
                    }
                    else if ( _bells == 2) {
                         winnings =  playerBet * 10
                    }
                    else if ( _sevens == 2) {
                         winnings =  playerBet * 20
                    }
                    else if ( _sevens == 1) {
                         winnings =  playerBet * 5
                    }
                    else {
                         winnings =  playerBet * 1
                    }
                    print("Win!")
                }
                else {
                    print("Loss!")
                }

                 _resultText.text =  String(winnings)
                 playerMoney +=  winnings
                 _creditsText.text =  String(playerMoney)
                 _resetFruitTally()

            }//determine winnings
   
    func _placeBet(playerBet:Int) {
                // ensure player's bet is less than or equal to players money
                if (playerBet <=  playerMoney) {
                    self.playerBet += playerBet
                     playerMoney -= playerBet
                     _creditsText.text =  String(playerMoney)
                     _betText.text =  String(playerBet)
                }
            }
    
    func _resetFruitTally()
    {
        _grapes = 0;
        _bananas = 0;
        _oranges = 0;
        _cherries = 0;
        _bars = 0;
        _bells = 0;
        _sevens = 0;
        _blanks = 0;
    }
    
    @IBAction func _bet1ButtonClick(_ sender: UIButton)
    {
        _placeBet(playerBet: 1)
    }
    @IBAction func _bet10ButtonClick(_ sender: Any)
    {
        _placeBet(playerBet: 10)
    }
    @IBAction func _bet100ButtonClick(_ sender: Any)
    {_placeBet(playerBet: 100)
    }
    @IBAction func _spinButtonClick(_ sender: Any)
    {
        _spinReels()
        _determineWinnings()
    }
}

