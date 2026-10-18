//
//  LoginViewModelTests.swift
//  LoginApp
//
//  Created by Bathi on 18/10/26.
//


import XCTest
@testable import LoginApp

final class LoginViewModelTests: XCTestCase {

    var sut: LoginViewModel!

    override func setUp() {
        super.setUp()
        sut = LoginViewModel()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testEmptyEmailReturnsFailure() {
        let result = sut.validate(
            email: "",
            password: "password123"
        )

        XCTAssertFalse(result)
        XCTAssertEqual(sut.message, "Email is required")
    }

    func testInvalidEmailReturnsFailure() {
        let result = sut.validate(
            email: "invalidEmail",
            password: "password123"
        )

        XCTAssertFalse(result)
        XCTAssertEqual(sut.message, "Invalid email")
    }

    func testShortPasswordReturnsFailure() {
        let result = sut.validate(
            email: "user@example.com",
            password: "123"
        )

        XCTAssertFalse(result)
        XCTAssertEqual(
            sut.message,
            "Password must be at least 8 characters"
        )
    }

    func testValidCredentialsReturnSuccess() {
        let result = sut.validate(
            email: "user@example.com",
            password: "password123"
        )

        XCTAssertTrue(result)
        XCTAssertEqual(sut.message, "Login successful")
    }
}
