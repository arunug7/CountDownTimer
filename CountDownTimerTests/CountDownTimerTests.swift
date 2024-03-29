//
//  CountDownTimerTests.swift
//  CountDownTimerTests
//
//  Created by Arun on 27/03/24.
//

import XCTest
@testable import CountDownTimer

final class CountDownTimerViewModelTests: XCTestCase {
    
    func testUpdateTimerValueWhen20Days() {
        let futureDate = Calendar.current.date(byAdding: .day, value: 20, to: Date())
        let countDownTimerVM = CountDownTimerViewModel(futureDate: futureDate ?? Date())
        countDownTimerVM.updateTimeRamaining()
        XCTAssertTrue(countDownTimerVM.days == "19")
        XCTAssertTrue(countDownTimerVM.hours == "23")
        XCTAssertTrue(countDownTimerVM.minutes == "59")
        XCTAssertTrue(countDownTimerVM.seconds == "59")
    }
    
    func testUpdateTimerValueWhen1Day() {
        let futureDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())
        let countDownTimerVM = CountDownTimerViewModel(futureDate: futureDate ?? Date())
        countDownTimerVM.updateTimeRamaining()
        XCTAssertTrue(countDownTimerVM.days == "0")
        XCTAssertTrue(countDownTimerVM.hours == "23")
        XCTAssertTrue(countDownTimerVM.minutes == "59")
        XCTAssertTrue(countDownTimerVM.seconds == "59")
    }
    
    func testUpdateTimerValueWhen1Hour() {
        let futureDate = Calendar.current.date(byAdding: .hour, value: 1, to: Date())
        let countDownTimerVM = CountDownTimerViewModel(futureDate: futureDate ?? Date())
        countDownTimerVM.updateTimeRamaining()
        XCTAssertTrue(countDownTimerVM.days == "0")
        XCTAssertTrue(countDownTimerVM.hours == "0")
        XCTAssertTrue(countDownTimerVM.minutes == "59")
        XCTAssertTrue(countDownTimerVM.seconds == "59")
    }

    func testUpdateTimerValueWhen5Hour() {
        let futureDate = Calendar.current.date(byAdding: .hour, value: 5, to: Date())
        let countDownTimerVM = CountDownTimerViewModel(futureDate: futureDate ?? Date())
        countDownTimerVM.updateTimeRamaining()
        XCTAssertTrue(countDownTimerVM.days == "0")
        XCTAssertTrue(countDownTimerVM.hours == "4")
        XCTAssertTrue(countDownTimerVM.minutes == "59")
        XCTAssertTrue(countDownTimerVM.seconds == "59")
    }
    
}
