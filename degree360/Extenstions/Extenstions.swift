//
//  Extenstions.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation

extension String {
    
    
    var date : Date {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        
        return df.date(from: self) ?? Date()
    }
    
}
