// ViewController.swift 
// Apple Pie
// Created on 7/13/21 by Conrad Flescher.
// Copyright 2021 Conrad Flescher. All rights reserved.

import UIKit

class ViewController: UIViewController {

    var words: [String] = ["buccaneer", "swift", "glorious", "incandescent",
                           "bug", "program"]
    
    let allowedIncorrectMoves = 7
    
    var totalWins = 0 {
        didSet {
            startNewRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            startNewRound()
        }
    }
    
    @IBOutlet var mainImageView: UIImageView!
    
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    var currentRound: Game!
    
    func enableLetterButtons(_ value: Bool) {
        for button in letterButtons {
            button.isEnabled = value
        }
    }

    func startNewRound() {
        if !words.isEmpty {
            let newWord = words.removeFirst()
            currentRound = Game(word: newWord, incorrectMovesRemaining: allowedIncorrectMoves, guessedLetters: [])
            enableLetterButtons(true)
        } else {
            enableLetterButtons(false)
        }
        
    }
    
    func updateGameState() {
        if currentRound.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentRound.word == currentRound.formattedWord {
            totalWins += 1
            updateUi()
        } else {
            updateUi()
        }
    }

    func updateUi() {
        var letters = [String]()
        for letter in currentRound.formattedWord {
            letters.append(String(letter))
        }
        let spacedWord = letters.joined(separator: " ")
        correctWordLabel.text = spacedWord
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        mainImageView.image = UIImage(named: "Tree \(currentRound.incorrectMovesRemaining)")
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.titleLabel!.text
        let letter = Character(letterString!.lowercased())
        currentRound.playerGuessed(letter)
        updateGameState()
    }
}

