//
//  UIImageView+Extension.swift
//
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation
import UIKit

extension UIImageView {
    public func loadRemoteImage(from url: URL, placeholder: UIImage? = nil) {
        self.image = placeholder
        
        if let cachedImage = ImageCache.shared.object(forKey: url as NSURL) {
            self.image = cachedImage
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            if let data = try? Data(contentsOf: url), 
                let image = UIImage(data: data) {
                ImageCache.shared.setObject(image, forKey: url as NSURL)
                
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
