//
//  Extension+UIImageView.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit
import Indigear

extension UIImageView {
    
    func setImage(_ url : String) {
        Indigear.get(url){ res in
            guard let imageData = res.result else {
                return
            }
            self.image = UIImage(data: imageData)
        }
        
    }
    
}
