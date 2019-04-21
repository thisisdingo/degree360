//
//  API.swift
//  degree360
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import SwiftyJSON
import Indigear
import UIKit

typealias callback = (_ json : JSON?, _ error : String?) -> Void

class API {
    
    func toJSON(_ dic : [String : Any]) -> Data {
        return try! JSONSerialization.data(withJSONObject: dic, options: [.sortedKeys])
    }
    
    let headers = ["Content-Type" : "application/json",
                   "Accept" : "application/json"]

    func uploadImage(_ image : UIImage, _ c : @escaping callback){
        
        guard let imageData = image.jpegData(compressionQuality: 0.2) else {
            c(nil, "Не удалось сконвертировать изображение в JPG")
            return
        }
        
        
        let dic = ["photo" : "data:image/jpeg;base64,"+imageData.base64EncodedString(),
                   "uid" : UserController.shared.userId] as [String : Any]
        
        let json = toJSON(dic)

        Indigear.run(Constants.serverAddress + "api/user/avatar", method: .post, headers: headers, body: json, { res in
            if let err = res.error {
                c(nil, err.localizedDescription)
            }else{
                print(String(data: res.result!, encoding: .utf8))
                c(JSON(res.result!), nil)
            }
        })
    }
    
    func createUser(_ name : String, _ c : @escaping callback){
        
        let dic = ["name" : name]
        
        Indigear.run(Constants.serverAddress + "api/user", method: .post, headers: headers, body: toJSON(dic), { res in
            if let err = res.error {
                c(nil, err.localizedDescription)
            }else{
                c(JSON(res.result!), nil)
            }
        })
    }
    
    func createLesson(_ title : String, _ description : String, _ topics : [String], _ c : @escaping callback){
        let dic : [String : Any] = ["title" : title,
                                    "description" : description,
                                    "user_id" : UserController.shared.userId,
                                    "topics" : topics ]
        
        
        
        Indigear.run(Constants.serverAddress + "api/lesson", method: .post, headers: headers, body: toJSON(dic), { res in
            if let err = res.error {
                c(nil, err.localizedDescription)
            }else{
                c(JSON(res.result!), nil)
            }
        })

    }
    
    func getLessons(_ c : @escaping callback){
        let dic : [String : Any] = ["uid" : UserController.shared.userId ]
        
        Indigear.run(Constants.serverAddress + "api/lessons", method: .post, headers: headers, body: toJSON(dic), { res in
            if let err = res.error {
                c(nil, err.localizedDescription)
            }else{
                c(JSON(res.result!), nil)
            }
        })
        
    }
    
    func joinRoom(_ roomId : String, _ c : @escaping callback){
        let dic : [String : Any] = ["uid" : UserController.shared.userId ]
        
        Indigear.run(Constants.serverAddress + "api/lesson/join/\(roomId)", method: .post, headers: headers, body: toJSON(dic), { res in
            if let err = res.error {
                c(nil, err.localizedDescription)
            }else{
                c(JSON(res.result!), nil)
            }
        })
    }
    
    func getLessonById(_ id : String,  _ c : @escaping callback){
        Indigear.run(Constants.serverAddress + "api/lesson/\(id)") { res in
            if let err = res.error {
                c(nil, err.localizedDescription)
            }else{
                c(JSON(res.result!), nil)
            }
        }
        
    }
    
    
    func rateFriend(_ userId : String, _ topicId : String, _ value : String, _ c : @escaping callback){
        let dic : [String : Any] = ["uid" : UserController.shared.userId,
                                    "friend_id" : userId,
                                    "topic_id" : topicId,
                                    "value" : value]
        
        Indigear.run(Constants.serverAddress + "api/rate", method: .post, headers: headers, body: toJSON(dic), { res in
            if let err = res.error {
                c(nil, err.localizedDescription)
            }else{
                c(JSON(res.result!), nil)
            }
        })
    }
    
    func getMyRateForUser(_ userId : String, _ topicId : String, _ c : @escaping callback){
        let dic : [String : Any] = ["uid" : UserController.shared.userId,
                                    "user_id" : userId,
                                    "topic_id" : topicId]
        
        Indigear.run(Constants.serverAddress + "api/lesson/myrates", method: .post, headers: headers, body: toJSON(dic), { res in
            if let err = res.error {
                c(nil, err.localizedDescription)
            }else{
                c(JSON(res.result!), nil)
            }
        })
    }
    
    func getStatsForLesson(_ lessonId : String, _ c : @escaping callback){
        let dic : [String : Any] = ["uid" : UserController.shared.userId,
                                    "lesson_id" : lessonId]
        
        Indigear.run(Constants.serverAddress + "api/lesson/myrates", method: .post, headers: headers, body: toJSON(dic), { res in
            if let err = res.error {
                c(nil, err.localizedDescription)
            }else{
                c(JSON(res.result!), nil)
            }
        })
    }
    
}
