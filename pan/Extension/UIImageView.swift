//
//  UIImageView.swift
//  pan
//
//  Created by Cola on 2017/5/2.
//  Copyright © 2017年 Cola. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadedFrom(url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard data != nil else {
                return
            }
            DispatchQueue.main.async() { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            }
            }.resume()
    }
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, contentMode: mode)
    }
}
