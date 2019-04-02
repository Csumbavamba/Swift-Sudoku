//
//  main.swift
//  Sudoku
//
//  Created by Zsombor Pirok on 18/03/19.
//  Copyright © 2019 Kill Me. All rights reserved.
//

import Foundation


let puzzleToSolve = "...............3.85..1.2.......5.7.....4...1...9.......5......73..2.1........4...9"

let gameBoard = GameBoard(puzzle: puzzleToSolve)
let solver = SudokuSolver(gameBoard: gameBoard)

print (gameBoard)
solver.bruteForce()
print(solver.gameBoard)

