//
//  BaseViewController.swift
//  NearByRestaurant
//
//  Created by Nirbhay Singh on 04/04/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
    
    
    /// To display the message, slide up message from bottom and will disappears after 4 sec
    func show(message: String, font: UIFont = UIFont.systemFont(ofSize: 14)) {
        
        let toastLabel = getToastLabel()
        toastLabel.text = message
        toastLabel.font = font
        
        let maxWidthPercentage: CGFloat = 0.8
        let maxTitleSize = CGSize(width: view.bounds.size.width * maxWidthPercentage, height: view.bounds.size.height-150)
        var titleSize = toastLabel.sizeThatFits(maxTitleSize)
        titleSize.width += 20
        titleSize.height += 10
        toastLabel.frame = CGRect(x: self.view.frame.size.width / 2 - titleSize.width / 2, y: self.view.frame.size.height, width: titleSize.width, height: titleSize.height)
        view.addSubview(toastLabel)
        
        
        UIView.animate(withDuration: 1) {
            toastLabel.frame = CGRect(x: self.view.frame.size.width / 2 - titleSize.width / 2, y: self.view.frame.size.height - 150, width: titleSize.width, height: titleSize.height)
        }
        
        UIView.animate(withDuration: 1, delay: 4, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {_ in
            toastLabel.removeFromSuperview()
        })
    }

}

private extension BaseViewController {
    
    private func getToastLabel() -> UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        label.textColor = .white
        label.textAlignment = .center
        label.alpha = 1.0
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.numberOfLines = 0
        
        return label
    }
    
}
