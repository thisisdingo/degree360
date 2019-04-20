//
//  LessonInteractor.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation

protocol LessonInteractorProtocol : BaseInteractorProtocol{
    func showLessons( _ lessons : [Lesson])
    func showNoLessons()
}

class LessonInteractor : BaseInteractor {
    
    
    init(_ delegate : LessonInteractorProtocol){
        super.init()
        
        self.delegate = delegate
    }

    
    func getLessons(){
        self.delegate?.startLoading()
        
        api.getLessons({ res, err in
            self.delegate?.hideLoading()
            
            if let err = err {
                self.delegate?.showMessage(err)
            }else{
                if res!.hasError {
                    self.delegate?.showMessage(res!.errorMessage)
                }else{
                    (self.delegate as? LessonInteractorProtocol)?.showLessons(res!.arrayValue.map({ Lesson($0["lesson"]) }))
                }
            }
        })
        
    }
    
    
}
