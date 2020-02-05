//
//  Chunk.swift
//  Shapes2D
//
//  Created by Germán Santos Jaimes on 30/12/19.
//  Copyright © 2019 Germán Santos Jaimes. All rights reserved.
//

import UIKit

enum Chunk{
    case moveTo(point: CGPoint)
    
    func controlPoints() -> [CGPoint]{
        switch self {
            case .moveTo(let point): return [point]
        }
    }
    
    func createChunk(_ newPoint: CGPoint, atElementIndex: Int) -> Chunk{
        switch self{
        case .moveTo:
//            precondition(atElementIndex == 0)
            return .moveTo(point: newPoint)
        }
    }
}
