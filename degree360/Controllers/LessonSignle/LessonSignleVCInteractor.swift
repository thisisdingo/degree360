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
    
    func didJoined(_ lesson : Lesson)
    func gotMeRateForUser(_ rate: Rate)
    func getStatsForUsers(_ rates : [User])
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
                    print(res!)
                    (self.delegate as? LessonSignleVCInteractorProtocol)?.successRatingSet()
                }
            }
        }
    }
    
    func joinTapped(_ lessonId : String) {
        api.joinRoom(lessonId){ res, err in
            
            self.delegate?.hideLoading()
            
            if let err = err {
                self.delegate?.showMessage(err)
            }else{
                if res!.hasError {
                    self.delegate?.showMessage(res!.errorMessage)
                }else{
                    (self.delegate as? LessonSignleVCInteractorProtocol)?.didJoined(Lesson(res!))
                }
            }
        }
    }
    
    func getMyRateForThisUser(_ userId: String, _ topicId: String){
        api.getMyRateForUser(userId, topicId){ res, err in
            
            self.delegate?.hideLoading()
            
            if let err = err {
                self.delegate?.showMessage(err)
            }else{
                if res!.hasError {
                    self.delegate?.showMessage(res!.errorMessage)
                }else{
                    (self.delegate as? LessonSignleVCInteractorProtocol)?.gotMeRateForUser(Rate(res!))
                }
            }
        }
    }
    
    func fetchStats(_ lessonId : String){
        api.getStatsForLesson(lessonId, { res, err in
            
            if let err = err {
                self.delegate?.showMessage(err)
            }else{
                if res!.hasError {
                    self.delegate?.showMessage(res!.errorMessage)
                }else{
                    let stats = res!["friends"].arrayValue.map({ User($0["user"]) })
                    print(res!)

                    (self.delegate as? LessonSignleVCInteractorProtocol)?.getStatsForUsers(stats)
                }
            }
            
        })
    }
}
