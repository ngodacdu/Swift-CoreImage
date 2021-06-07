
import UIKit
import CoreImage

// MARK: - Querying Core Image for Filters

kCICategoryHalftoneEffect
CIFilter.localizedName(forCategory: kCICategoryHalftoneEffect)
CIFilter.filterNames(inCategory: kCICategoryHalftoneEffect)
CIFilter.filterNames(inCategories: nil)
CIFilter.filterNames(inCategories: [kCICategoryVideo, kCICategoryStillImage])

CIFilter.localizedName(forCategory: "CICMYKHalftone")
CIFilter.localizedDescription(forFilterName: "CICMYKHalftone")

CIFilter(name: "xyz")
CIFilter(name: "CICMYKHalftone")

func topic(message: String, block: () -> Void) {
    print(message)
    block()
}

topic(message: "Filter CICMYKHalftone") {
    let filter = CIFilter(name: "CICMYKHalftone")
    guard let attribute = filter?.attributes["inputGCR"] as? [String : AnyObject] else {
        return
    }
    guard let minimum = attribute[kCIAttributeSliderMin] as? Float else {
        return
    }
    guard let maximum = attribute[kCIAttributeSliderMax] as? Float else {
        return
    }
    guard let defaultValue = attribute[kCIAttributeDefault] as? Float else {
        return
    }
    let slider = UISlider()
    slider.minimumValue = minimum
    slider.maximumValue = maximum
    slider.value = defaultValue
}
