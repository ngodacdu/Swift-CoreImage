//
//  ViewController.swift
//  TWFilterMonkey
//
//  Created by Ngo Dac Du on 6/4/21.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    @IBOutlet weak var originImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func applyFilter(_ sender: Any) {
        guard let originImage = originImageView.image else {
            return
        }
        let context = CIContext(options: nil)
        let beginImage = CIImage(image: originImage)
        CIFilter.registerName("Flame",
                              constructor: CustomFiltersVendor(),
                              classAttributes: [kCIAttributeFilterCategories : ["Custom Filters"]])
        guard let filter = TWFlame(name: "Flame") else {
            return
        }
        filter.setValue(beginImage, forKey: kCIInputImageKey)
        if let output = filter.outputImage {
            if let cgimg = context.createCGImage(output, from: output.extent) {
                originImageView.image = UIImage(cgImage: cgimg)
            }
        }
    }
    
}

class CustomFiltersVendor: CIFilterConstructor {
    
    func filter(withName name: String) -> CIFilter? {
        return TWFlame()
    }
    
}

