// Game.swift 
// Apple Pie
// Created on 7/15/21 by Conrad Flescher.
// Copyright 2021 Conrad Flescher. All rights reserved.

import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    
    var guessedLetters: [Character] = []
    
    mutating func playerGuessed(_ letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
    var formattedWord: String {
        var guessedWord = ""
        
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        
        return guessedWord
    }
}
