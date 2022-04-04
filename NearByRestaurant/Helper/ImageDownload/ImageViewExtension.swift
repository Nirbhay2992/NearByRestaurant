//
//  ImageViewExtension.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import Foundation
import UIKit

var imageCache = NSCache<NSString,UIImage>()

extension UIImageView {
    
    /**
     To download the image fomr the given url
     */
    private func download(from url: URL, contentMode mode: UIView.ContentMode) {
        contentMode = mode
        
        // check for cache
        if let cacheImage = imageCache.object(forKey: url.absoluteString as String as NSString) {
                self.image = cacheImage
                return
        }
       
        // download image only if image is not cached
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
             DispatchQueue.main.async() {
                imageCache .setObject(image, forKey: url.absoluteString as String as NSString)
                self.image = image
            }
        }.resume()
    }
   
    
    public func download(from link: String, contentMode mode: UIView.ContentMode = .center) {
        guard let url = URL(string: link) else { return }
        download(from: url, contentMode: mode)
    }
}
