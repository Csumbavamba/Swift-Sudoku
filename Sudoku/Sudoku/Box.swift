//
//  Box.swift
//  Sudoku
//
//  Created by Zsombor Pirok on 18/03/19.
//  Copyright © 2019 Kill Me. All rights reserved.
//

import Foundation


public struct Box<T>
{
    let rows: Int, columns: Int;
    var grid: [Int]; // 2 dimensional array
    
    init(rows: Int, columns: Int)
    {
        self.rows = rows;
        self.columns = columns;
        grid = Array(repeating: 0, count: rows * columns);
    }
    
    func IsIndexValid(row: Int, column: Int) -> Bool
    {
        return row >= 0 && row < rows && column >= 0 && column < columns;
    }
    
    subscript(row: Int, column: Int) -> Int
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
}
