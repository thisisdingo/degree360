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
    
    var lesson = Lesson()

    var createLessonExp : XCTestExpectation!
    var getLessonsExp : XCTestExpectation!

    
    override func setUp() {
        UserController.shared.userId = "1"

        lesson.title = "ios app test"
        lesson.description = "ios app test"
        lesson.topics = ["ios app test", "ios app test", "ios app test", "ios app test"]
        

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    

    
    func testLessonCreate(){
        createLessonExp = expectation(description: "createLessonExp")

        let interactor = LessonCreateInteractor.init(self)
        interactor.createLesson(lesson.title, lesson.description, lesson.topics)
        
        waitForExpectations(timeout: 4, handler: nil)
    }
    
    func testGetLessons(){
        getLessonsExp = expectation(description: "getLessonsExp")

        let interactor = LessonInteractor.init(self)
        interactor.getLessons()
        
        waitForExpectations(timeout: 4, handler: nil)

    }
    

}

extension degree360Tests : LessonInteractorProtocol {
    func showLessons(_ lessons: [Lesson]) {
        print(lessons)
        getLessonsExp.fulfill()
    }

}

extension degree360Tests : BaseInteractorProtocol {
    
    func showMessage(_ message: String) {
        print(message)
    }
    
    func startLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
}

extension degree360Tests : LessonCreateInteractorProtocol {
    func successCreate(_ lesson: Lesson) {
        XCTAssert(self.lesson.title == lesson.title, "Error")
        createLessonExp.fulfill()
    }
    

    
}
