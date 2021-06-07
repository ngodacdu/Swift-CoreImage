//
//  TWCIVector.swift
//  TWFilterMonkey
//
//  Created by Ngo Dac Du on 6/5/21.
//

import UIKit
import CoreImage

extension CGPoint {
    func toVector() -> CIVector {
        return CIVector(cgPoint: self)
    }
}

extension CGRect {
    func toVector() -> CIVector {
        return CIVector(cgRect: self)
    }
}
