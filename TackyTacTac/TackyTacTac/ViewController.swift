//
//  ViewController.swift
//  TackyTacTac
//
//  Created by Michael Reynolds on 10/26/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var grid = [[0,0,0], [0,0,0], [0,0,0]]
    var playButtons = [TTTButton]()
    
    var isPlayer1Turn = true
    
    var player1Score = 0
    var player2Score = 0
    var stalemateScore = 0
    var boxChecked = 0
    var playerWon = false
    
    let gameStatusLabel = UILabel(frame: CGRect(x: 0, y: 80, width: 200, height: 50))
    let player1Label = UILabel(frame: CGRect(x: 0, y: 450, width: 150, height: 25))
    let player2Label = UILabel(frame: CGRect(x: 0, y: 475, width: 150, height: 25))
    let stalemateLabel = UILabel(frame: CGRect(x: 0, y: 500, width: 150, height: 25))
    let resetButton = UIButton(frame: CGRect(x: 0, y: 45, width: 150, height: 15))
    let resetScoreButton = UIButton(frame: CGRect(x: 0, y: 65, width: 150, height: 15))

    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        
        gameStatusLabel.text = "Player 1 Turn"
        gameStatusLabel.textAlignment = .Center
        gameStatusLabel.center.x = view.center.x
        view.addSubview(gameStatusLabel)
        
        player1Label.text = "Player 1 Score: 0"
        player1Label.textAlignment = .Center
        player1Label.center.x = view.center.x
        view.addSubview(player1Label)
        
        player2Label.text = "Player 2 Score: 0"
        player2Label.textAlignment = .Center
        player2Label.center.x = view.center.x
        view.addSubview(player2Label)
        
        stalemateLabel.text = "Stalemates: 0"
        stalemateLabel.textAlignment = .Center
        stalemateLabel.center.x = view.center.x
        view.addSubview(stalemateLabel)
        
        resetScoreButton.setTitle("Reset ScoreBoard", forState: .Normal)
        resetScoreButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
        resetScoreButton.center.x = view.center.x
        view.addSubview(resetScoreButton)
        
        
//        resetButton.setTitle("Play New Game", forState: .Normal)
//        resetButton.setTitle("Let's Get it ON!", forState: .Selected)
//        resetButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
//        resetButton.setTitleColor(UIColor.redColor(), forState: .Selected)
//        resetButton.center.x = view.center.x
//        view.addSubview(resetButton)
        
        
        let screenHeight = Int(UIScreen.mainScreen().bounds.height)
        let screenWidth = Int(UIScreen.mainScreen().bounds.width)
        
        let buttonHW = 100
        let buttonSpacing = 4
        
        let gridHW = (buttonHW * 3) + (buttonSpacing * 2)
        
        let leftSpacing = (screenWidth - gridHW) / 2
        let topSpacing = (screenHeight - gridHW) / 2
        
        for (r, row) in grid.enumerate()
        {
            for (c, _) in row.enumerate()
            {
                let x = c * (buttonHW + buttonSpacing) + leftSpacing
                let y = r * (buttonHW + buttonSpacing) + topSpacing
                
                let button = TTTButton(frame: CGRect(x: x, y: y, width: buttonHW, height: buttonHW))
                button.backgroundColor = UIColor.cyanColor()
                
                button.row = r
                button.col = c
                
                button.addTarget(self, action: "spacePressed:", forControlEvents: .TouchUpInside)
                view.addSubview(button)
                
                playButtons.append(button)
            }
        }
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Action Handlers
    
    func spacePressed(button: TTTButton)
    {
//        if button.player == 0
//        {
//            if isPlayer1Turn
//            {
//                button.player = 1
//            }
//            else
//            {
//                button.player = 2
//            }
//        }
        button.player = isPlayer1Turn ? 1 : 2
        // question mark is a turnary operator in this case
        
        grid[button.row][button.col] = isPlayer1Turn ? 1 : 2
        
        isPlayer1Turn = !isPlayer1Turn
        
        if isPlayer1Turn
        {
            gameStatusLabel.text = "Player 1 Turn"
        }
        else
        {
            gameStatusLabel.text = "Player 2 Turn"
        }
        
        checkForWinner()

    }

    // MARK: - Misc.
    
    func checkForWinner()
    {
        let possibilities =
        [
            ((0,0),(0,1),(0,2)),
            ((1,0),(1,1),(1,2)),
            ((2,0),(2,1),(2,2)),
            ((0,0),(1,0),(2,0)),
            ((0,1),(1,1),(2,1)),
            ((0,2),(1,2),(2,2)),
            ((0,0),(1,1),(2,2)),
            ((2,0),(1,1),(0,2))
        ]
        for possibility in possibilities
        {
            let (p1, p2, p3) = possibility
            
            let value1 = grid[p1.0][p1.1]
            let value2 = grid[p2.0][p2.1]
            let value3 = grid[p3.0][p3.1]
            
            if value1 == value2 && value2 == value3
            {
                if value1 != 0
                {
                    gameStatusLabel.text = "Player \(value1) wins!"
                    if gameStatusLabel.text == "Player 1 wins!"
                    {
                        player1Score++
                        player1Label.text = "Player 1 Score: \(player1Score)"
                        playerWon = true
                    }
                    else if gameStatusLabel.text == "Player 2 wins!"
                    {
                        player2Score++
                        player2Label.text = "Player 2 Score: \(player2Score)"
                        playerWon = true
                    }
                    
                }
                
            }
        }
        boxChecked++
        if boxChecked == 9 && playerWon == false
        {
            gameStatusLabel.text = "Stalemate!"
            stalemateScore++
            stalemateLabel.text = "Stalemates: \(stalemateScore)"
        }
//        if playerWon == true
//        {
//            if boxChecked > 5 && boxChecked < 10
//            {
//                gameStatusLabel.text = "Select, 'Play New Game'"
//            }
//        }
        if playerWon == true
        {
            resetButton.setTitle("Play New Game", forState: .Normal)
            resetButton.setTitle("Let's Get it ON!", forState: .Selected)
            resetButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            resetButton.setTitleColor(UIColor.redColor(), forState: .Selected)
            resetButton.center.x = view.center.x
            view.addSubview(resetButton)
            
            resetButton.addTarget(self, action: "resetButtonTapped:", forControlEvents: .TouchUpInside)
            
            resetScoreButton.addTarget(self, action: "resetScoreBoard:", forControlEvents: .TouchUpInside)

        }
        
    }
    
    func resetScoreBoard(resetScoreButton: UIButton)
    {
        player1Score = 0
        player1Label.text = "Player 1 Score: 0"
        player2Score = 0
        player2Label.text = "Player 2 Score: 0"
        stalemateScore = 0
        stalemateLabel.text = "Stalemates: 0"
        
    }
    
    func randomColor() -> UIColor
    {
        
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())
        let randomBlue:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    }
    
    func resetButtonTapped(resetButton: UIButton)
    {
        randomColor()
        for aButton in playButtons
        {
            aButton.player = 0
            grid = [[0,0,0], [0,0,0], [0,0,0]]
            gameStatusLabel.text = "Player 1 Turn"
            
        }
    
    }
    
}

class TTTButton: UIButton
{
    var row = 0
    var col = 0
    
    var player = 0 {
        didSet {
            switch player {
                case 1: backgroundColor = UIColor.magentaColor()
                case 2: backgroundColor = UIColor.yellowColor()
                default: backgroundColor = UIColor.cyanColor()
                }
                
            
        }
    }
}
