//
//  RegisterInteractor.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import UIKit

protocol RegisterInteractorProtocol : BaseInteractorProtocol {
    func successRegister()
}

class RegisterInteractor : BaseInteractor {
    
    
    init(_ delegate : RegisterInteractorProtocol){
        super.init()

        self.delegate = delegate
    }
    
    func register(_ name: String, _ photo: UIImage){
        self.delegate?.startLoading()
        api.createUser(name, { json, err in
            if let err = err {
                self.delegate?.hideLoading()
                self.delegate?.showMessage(err)
            }else{
                if json!.hasError {
                    self.delegate?.hideLoading()
                    self.delegate?.showMessage(json!.errorMessage)
                }else{
                    let userId = json!["id"].stringValue
                    UserController.shared.userId = userId
                    self.uploadAvatar(photo)
                }
            }
        })
    }
    
    private func uploadAvatar(_ image : UIImage){
        api.uploadImage(image, { json, err in
            if let err = err {
                self.delegate?.hideLoading()
                self.delegate?.showMessage(err)
            }else{
                print(json!)
                if json!.hasError {
                    self.delegate?.hideLoading()
                    self.delegate?.showMessage(json!.errorMessage)
                }else{
                    self.delegate?.hideLoading()
                    (self.delegate as? RegisterInteractorProtocol)?.successRegister()
                }
            }
        })
    }
}
