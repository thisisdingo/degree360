//
//  degree360Tests.swift
//  degree360Tests
//
//  Created by Mister Gamburger on 20/04/2019.
//  Copyright © 2019 pizza. All rights reserved.
//

import XCTest
@testable import degree360

class degree360Tests: XCTestCase {

    var createLessonExp : XCTestExpectation!
    
    
    override func setUp() {
        createLessonExp = expectation(description: "createLessonExp")

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

    
    func testLessonCreate(){
        UserController.shared.userId = "1"
        let interactor = LessonCreateInteractor.init(self)
        interactor.createLesson("iOS Test", "tesDescr", ["topic1", "topic2", "topic3"])
        
        waitForExpectations(timeout: 4, handler: nil)
    }
    
}
extension degree360Tests : LessonCreateInteractorProtocol {
    func successCreate(_ lesson: Lesson) {
        print(lesson)
        createLessonExp.fulfill()
    }
    
    func showMessage(_ message: String) {
        print(message)
    }
    
    func startLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
}
