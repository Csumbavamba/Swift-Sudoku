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
                // If the value is already found, continue
                if node.isFound{return}
                
                // Check the unknown value, for potential values
                let potentialValues = (1...9).filter({value in
                    return gameBoard.canUpdate(index: index, toValue: value)
                })
                
                // If potential values is zero, then it's broken, return
                if potentialValues.count == 0 {return}
                
                // This value has been found, if the rest of the link is still working
                if potentialValues.count == 1 {hasImproved = true}
                
                try? gameBoard.update(index: index, values: potentialValues)
            })
            
            if !hasImproved {return}

        }
    }
    
    public func bruteForce ()
    {
        self.solveSudoku()
        
        if isSolved
        {
            print("Sudoku Solved")
            print(gameBoard)
            return
            
        }
    
            
        let (index,node) = gameBoard.nodes.enumerated().first(where: {!$0.element.isFound})!
        
        if index == 2
        {
            print("Index went through 2")
        }
            
        for value in node.potentialValues{
            var currentBoard = self.gameBoard
                
            do
            {
                // See if the copied board can be updated or not
                try currentBoard.update(index: index, values:  [value])
                print(currentBoard) // Print to screen
                    
                    
            } catch let error {
                if error is ValueSet {continue}
            }
                
            // print("Continue")
                
            let sudokuSolver = SudokuSolver(gameBoard: currentBoard)
            sudokuSolver.bruteForce()
                
            if (sudokuSolver.isSolved)
            {
                print("Sudoku Solved")
                print(sudokuSolver.gameBoard)
                self.gameBoard = sudokuSolver.gameBoard
            }
            
        }
    }
}
