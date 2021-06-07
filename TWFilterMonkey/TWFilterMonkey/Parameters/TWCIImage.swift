//
//  PWCIImage.swift
//  TWFilterMonkey
//
//  Created by Ngo Dac Du on 6/5/21.
//

import UIKit
import CoreImage

extension UIImage {
    
    func toCIImage(isOriented: Bool = true) -> CIImage? {
        if isOriented {
            return CIImage(image: self)
        }
        let tiff = imageOrientationToTiffOrientation(value: imageOrientation)
        return CIImage(image: self)?.oriented(forExifOrientation: tiff)
    }
    
    private func imageOrientationToTiffOrientation(value: UIImage.Orientation) -> Int32 {
        switch (value) {
        case .up: return 1
        case .down: return 3
        case .left: return 8
        case .right: return 6
        case .upMirrored: return 2
        case .downMirrored: return 4
        case .leftMirrored: return 5
        case .rightMirrored: return 7
        @unknown default:
            fatalError("Fail to verify orientation")
        }
    }
    
}

extension CIImage {
    func toUIImage() -> UIImage {
        return UIImage(ciImage: self)
    }
}
