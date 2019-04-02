//
//  Sequencer.swift
//  Sudoku
//
//  Created by Zsombor Pirok on 2/04/19.
//  Copyright © 2019 Kill Me. All rights reserved.
//

import Foundation

extension Sequence
{
    public func all (predicate: (Self.Iterator.Element) throws -> Bool) rethrows -> Bool
    {
        for element in self
        {
            let result = try predicate(element)
                if !result
                {
                    return false;
                }
        }
        
        return true;
    }
}
