//
//  UIImageExtension.swift
//  Weather
//
//  Created by Sai Pratap Koppolu on 14/09/22.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    func setImage(with name: String) {
            guard let url = URL(string: "https://openweathermap.org/img/wn/\(name)@2x.png") else { return
            }
            
            if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
                image = imageFromCache
                return
            }

            DispatchQueue.global(qos: .background).async { [weak self] in
                guard let data = try? Data(contentsOf: url) else { return }
                DispatchQueue.main.async {
                    guard let imageToCache = UIImage(data: data) else { return }
                    self?.image = imageToCache
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
            }
            
        }
}
