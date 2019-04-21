//
//  TopicInteractor.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation

protocol LessonSignleVCInteractorProtocol : BaseInteractorProtocol {

    func showFriends()
    func showFriendTopics(_ topics : [Topic])
    func successRatingSet()
    
    func successRatingUpdate()
    
}

class LessonSignleVCInteractor : BaseInteractor {
    
    init(_ delegate : LessonSignleVCInteractorProtocol){
        super.init()
        
        self.delegate = delegate
    }

    func setRaiting(_ userId: String, _ topicId: String, _ rating: Int){
        api.rateFriend(userId, topicId, String(rating)){ res, err in
            
            self.delegate?.hideLoading()
            
            if let err = err {
                self.delegate?.showMessage(err)
            }else{
                if res!.hasError {
                    self.delegate?.showMessage(res!.errorMessage)
                }else{
                    (self.delegate as? LessonSignleVCInteractorProtocol)?.successRatingSet()
                }
            }
        }
    }
}
