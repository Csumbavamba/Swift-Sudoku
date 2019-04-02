//
//  SudokuSolver.swift
//  Sudoku
//
//  Created by Zsombor Pirok on 2/04/19.
//  Copyright © 2019 Kill Me. All rights reserved.
//

import Foundation

public class SudokuSolver
{
    public var gameBoard: GameBoard
    
    public init (gameBoard: GameBoard)
    {
        self.gameBoard = gameBoard
    }
    
    public var isSolved: Bool
    {
        return gameBoard.isSolved
    }
    
    public func solveSudoku()
    {
        while !isSolved
        {
            var hasImproved = false;
            
            gameBoard.nodes.enumerated().forEach({index, node in
                // If the value is already found ignore
                if node.isFound {return}
                
                let potentialValues = (1...9).filter({value in
                    return gameBoard.canUpdate(index: index, toValue: value)
                })
                
                if potentialValues.count == 0 {return}
                if potentialValues.count == 1 {hasImproved = true}
                
                try? gameBoard.update(index: index, values: potentialValues)
                
            })
            
            if !hasImproved {return}
        }
    }
    
    public func bruteForce ()
    {
        self.solveSudoku()
        
        if isSolved {return}
        
        let (index,node) = gameBoard.nodes.enumerated().first(where: {$0.element.isFound})!
        
        for value in node.potentialValues{
            var copiedBoard = self.gameBoard
            
            do
            {
                // See if the copied board can be updated or not
                try copiedBoard.update(index: index, values:  [value])
                print(copiedBoard) // Print to screen
                
            } catch let error {
                if error is BoardError {continue}
            }
            
            let sudokuSolver = SudokuSolver(gameBoard: copiedBoard)
            sudokuSolver.bruteForce()
            
            if (sudokuSolver.isSolved)
            {
                self.gameBoard = sudokuSolver.gameBoard
            }
        }
    }
}
