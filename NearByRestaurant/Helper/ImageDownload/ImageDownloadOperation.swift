//
//  ImageDownloadOperation.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//


import UIKit

class ImageDownloadOperation: Operation {

    let url: String
    let imageView: UIImageView
    
    init(imageView: UIImageView, url: String) {
        self.url = url
        self.imageView = imageView
    }
    
    override func main() {
        
        if isCancelled {
            return
        }
        
        imageView.download(from: url)
    }
    
}
