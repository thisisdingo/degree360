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
    
    func showFriendTopics()
    
    func successRatingSet()
    
    func successRatingUpdate()
    
}

class LessonSignleVCInteractor : BaseInteractor{
    
    init(_ delegate : LessonSignleVCInteractorProtocol){
        super.init()
        
        self.delegate = delegate
    }
    
    func getFriends(_ lessonId: Int){
        
    }
    
    func getFriendTopics(_ userId: Int, _ lessonId: Int){
        
    }
    
    func setRaiting(_ userId: Int, _ topicId: Int, _ rating: Int){
        
    }
    
    func updateRaiting(_ userId: Int, _ topicId: Int, _ rating: Int){
        
    }
}
