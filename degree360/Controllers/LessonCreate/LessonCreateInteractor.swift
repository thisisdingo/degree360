//
//  LessonCreateInteractor.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation

protocol LessonCreateInteractorProtocol : BaseInteractorProtocol {
    func successCreate(_ lesson : Lesson)
}

class LessonCreateInteractor: BaseInteractor {
    
    init(_ delegate : LessonCreateInteractorProtocol){
        super.init()
        
        self.delegate = delegate
    }
    
    func createLesson(_ title: String, _ description: String, _ topics: [String]){
        self.delegate?.startLoading()
        api.createLesson(title, description, topics, { res, err in
            
            self.delegate?.hideLoading()

            if let err = err {
                self.delegate?.showMessage(err)
            }else{
                if res!.hasError {
                    self.delegate?.showMessage(res!.errorMessage)
                }else{
                    (self.delegate as? LessonCreateInteractorProtocol)?.successCreate(Lesson(res!))
                }
            }
        })
    }
    
}
