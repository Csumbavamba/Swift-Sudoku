//
//  GameBoard.swift
//  Sudoku
//
//  Created by Zsombor Pirok on 25/03/19.
//  Copyright © 2019 Kill Me. All rights reserved.
//

import Foundation

public struct ValueSet:Error{}

public struct GameBoard: CustomStringConvertible
{
    
    public var rows: [[Node]]
    
    
    init(puzzle: String)
    {
        // let characters = Array (puzzle.characters)
        
        var characters: [Character] = []
        
        for Character in puzzle
        {
            characters.append(Character)
        }
        
        // Populate the box
        self.rows = (0..<9).map({
                rowIndex in return characters[rowIndex*9..<rowIndex*9+9]}).map(
                    {
                        nestedIndex in return nestedIndex.map(
                            {char in
                                
                                if char == "0" // maybe needs to be .
                                {
                                    return Node.PopulateNode();
                                }
                                else if let value = Int(String(char))
                                {
                                    return Node.LockValue(value);
                                }
                                else{fatalError()}
                                
                            })
                    })
    }
    
    public var nodes: [Node]
    {
        return Array(rows.joined())
    }
    
    public var description: String
    {
        return self.rows.map (
            {
                row in return "[" + row.map ({$0.description}).joined(separator: " ") + "]\n"
            }).joined()
    }
    
    public var isSolved: Bool
    {
        return self.nodes.all(predicate: {$0.isFound})
    }
    
    public func row(rowIndex index: Int)->[Node]
    {
        let rowIndex = index/9
        return rows[rowIndex]
    }
    
    public func column(columIndex index: Int)->[Node]
    {
        let columnIndex = index/9
        return self.rows.map({row in return row[columnIndex]})
        
    }
    
    public func box(Index index: Int)->[Node]
    {
        let rowIndex = index/9
        let columnIndex = index % 9;
        let boxRowIndex = rowIndex / 3
        let boxColumnIndex = columnIndex / 3
        
        return (0..<3).flatMap({
            rowOffSet in return self.rows[boxRowIndex * 3 + rowOffSet][boxColumnIndex*3..<boxColumnIndex*3 + 3]})
    }
    
    public func canUpdate(index: Int, toValue value: Int) -> Bool
    {
        return !self.row(rowIndex: index).contains(.LockValue(value))
        && !self.column(columIndex: index).contains(.LockValue(value))
        && !self.box(Index: index).contains(.LockValue(value))
        
    }
    
    public mutating func update(index: Int, values: [Int]) throws
    {
        if values.count == 1, let value = values.first,
        self.canUpdate(index: index, toValue: value)
        {
            let newNode = Node(potentialValues: values)
            let rowIndex = index/9
            let columnIndex = index%9
            self.rows[rowIndex][columnIndex] = newNode
        }
        else {throw ValueSet()}
    }
    
}

