//
//  GameBoard.swift
//  Sudoku
//
//  Created by Zsombor Pirok on 25/03/19.
//  Copyright © 2019 Kill Me. All rights reserved.
//

import Foundation

public class GameBoard
{
    let rows: Int, columns: Int;
    var grid: [Box]; // 2 dimensional array
    
    init(rows: Int, columns: Int)
    {
        self.rows = rows;
        self.columns = columns;
        grid = Array(repeating: Box(rows: 3, columns: 3), count: rows * columns);
    }
    
    func IsIndexValid(row: Int, column: Int) -> Bool
    {
        return row >= 0 && row < rows && column >= 0 && column < columns;
    }
    
    subscript(row: Int, column: Int) -> Box
    {
        get
        {
            // Check if Index is out of range
            assert(IsIndexValid(row: row, column: column), "Index out of range");
            return grid[(row * columns) + column];
        }
        set
        {
            // Check if Index is out of range
            assert(IsIndexValid(row: row, column: column), "Index out of range");
            grid[(row * columns) + column] = newValue;
        }
        
    }
    
    func SetLineValues(row: Int, numbers: [Int]) -> Bool
    {
        // Check whether the array is out of range for the GameBoard
        if (columns * 3 < numbers.count)
        {
            // Send a Warning that the line is too big
            print("There are too many numbers inside the line you gave....");
            return false;
        }
        // Check whether there were enough numbers given
        else if (columns * 3 > numbers.count)
        {
            // Send a Warning that the line is too small
            print("There are too few numbers inside the line you gave....");
            return false;
        }
        else
        {
            return true;
        }
    }
}
