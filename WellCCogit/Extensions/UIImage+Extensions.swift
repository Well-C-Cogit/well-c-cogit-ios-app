//
//  UIImage+Extensions.swift
//  WellCCogit
//
//  Created by Junho Yoon on 9/6/24.
//

import UIKit

extension UIImage {
    func resizeImage(size: CGSize) -> UIImage {
        let resizedImage = UIGraphicsImageRenderer(size: size).image { _ in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        
        return resizedImage
    }
}
