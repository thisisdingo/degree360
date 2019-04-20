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
    
    
    init(_ delegate : BaseInteractorProtocol){
        super.init()

        self.delegate = delegate
    }
    
    func register(_ name: String, _ photo: UIImage){
        api.createUser(name, { json, err in
            if let err = err {
                self.delegate?.showMessage(err)
            }else{
                if json!.hasError {
                    self.delegate?.showMessage(json!.errorMessage)
                }else{
                    self.uploadAvatar(photo)
                }
            }
        })
    }
    
    private func uploadAvatar(_ image : UIImage){
        api.uploadImage(image, { json, err in
            if let err = err {
                self.delegate?.showMessage(err)
            }else{
                if json!.hasError {
                    self.delegate?.showMessage(json!.errorMessage)
                }else{
                    (self.delegate as! RegisterInteractorProtocol).successRegister()
                }
            }
        })
    }
}
