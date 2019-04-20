//
//  FriendInteractor.swift
//  degree360
//
//  Created by Ayaal Kaplin on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import Foundation

protocol FriendInteractorProtocol : BaseInteractorProtocol{
    
}

class FriendInteractor : BaseInteractor{
    
    init(_ delegate : BaseInteractorProtocol){
        super.init()
        
        self.delegate = delegate
    }
}
