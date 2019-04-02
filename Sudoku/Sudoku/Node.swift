//
//  Node.swift
//  Sudoku
//
//  Created by Zsombor Pirok on 2/04/19.
//  Copyright © 2019 Kill Me. All rights reserved.
//

import Foundation

public struct Node : Equatable, CustomStringConvertible
{
    public let potentialValues: [Int];
    
    public var isFound: Bool {return potentialValues.count == 1};
    
    // Overload the == operation for the two nodes
    public static func == (leftHandSide: Node, rightHandSide: Node) -> Bool
    {
        return leftHandSide.potentialValues == rightHandSide.potentialValues;
    }
    
    public var description: String
    {
        if isFound, let first = potentialValues.first
        {
            return String(first)
        }
        return "."
    }
    
    // Lock the value for a node
    public static func LockValue (_ valueToLock: Int) -> Node
    {
        return Node(potentialValues: [valueToLock])
    }
    
    public static func PopulateNode () -> Node
    {
        return Node(potentialValues: Array (1...9))
    }
}
