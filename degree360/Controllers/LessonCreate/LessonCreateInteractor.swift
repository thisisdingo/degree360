//
//  LessonCreateInteractor.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation

protocol LessonCreateInteractorProtocol : BaseInteractorProtocol {
    
}

class LessonCreateInteractor: BaseInteractor {
    
    init(_ delegate : LessonCreateInteractorProtocol){
        super.init()
        
        self.delegate = delegate
    }
    
}
