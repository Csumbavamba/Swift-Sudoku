//
//  main.swift
//  Sudoku
//
//  Created by Zsombor Pirok on 18/03/19.
//  Copyright © 2019 Kill Me. All rights reserved.
//

import Foundation


let puzzleToSolve = "003020600900305001001806400008102900700000008006708200002609500800203009005010300"

let gameBoard = GameBoard(puzzle: puzzleToSolve)
let solver = SudokuSolver(gameBoard: gameBoard)

print (gameBoard)
solver.bruteForce()
print(solver.gameBoard)
