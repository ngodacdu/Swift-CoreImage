
import UIKit

let mona = CIImage(image: UIImage(named: "monalisa.jpg")!)!

// MARK: - CIPhotoEffectMono
func monoFilter() -> CIFilter? {
    return CIFilter(name: "CIPhotoEffectMono",
                    parameters: [kCIInputImageKey : mona])
}
let monoImage = monoFilter()?.outputImage

// MARK: - CIFalseColor
func falseColorFilter() -> CIFilter? {
    guard let monoColorImage = monoImage else {
        return nil
    }
    return CIFilter(name: "CIFalseColor",
                    parameters: [
                        kCIInputImageKey : monoColorImage,
                        "inputColor0" : CIColor(red: 0.15, green: 0.15, blue: 1),
                        "inputColor1" : CIColor(red: 1, green: 1, blue: 0.5)
                    ]
    )
}
let falseColorImage = falseColorFilter()?.outputImage

// MARK: - CIVignette
func vignetteFilter() -> CIFilter? {
    guard let falseColorFilterImage = falseColorImage else {
        return nil
    }
    return CIFilter(name: "CIVignette",
                    parameters: [
                        kCIInputImageKey : falseColorFilterImage,
                        kCIInputRadiusKey : 4,
                        kCIInputIntensityKey : 4
                    ]
    )
}
let vignetteImage = vignetteFilter()?.outputImage
