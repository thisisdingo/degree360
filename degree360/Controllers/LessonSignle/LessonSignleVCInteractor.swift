//
//  TopicInteractor.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation

protocol LessonSignleVCInteractorProtocol : BaseInteractorProtocol {

}

class LessonSignleVCInteractor : BaseInteractor{
    
    init(_ delegate : LessonSignleVCInteractorProtocol){
        super.init()
        
        self.delegate = delegate
    }
    
}
