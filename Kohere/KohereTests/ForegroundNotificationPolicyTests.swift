import XCTest
@testable import Kohere

final class ForegroundNotificationPolicyTests: XCTestCase {
    func testSameChatRoomNotificationIsNotPresented() {
        let shouldPresent = ForegroundNotificationPolicy.shouldPresent(
            userInfo: ["chatRoomId": 10],
            activeChatRoomID: 10
        )

        XCTAssertFalse(shouldPresent)
    }

    func testStringChatRoomIDIsParsed() {
        let shouldPresent = ForegroundNotificationPolicy.shouldPresent(
            userInfo: ["chatRoomId": "10"],
            activeChatRoomID: 10
        )

        XCTAssertFalse(shouldPresent)
    }

    func testDifferentChatRoomNotificationIsPresented() {
        let shouldPresent = ForegroundNotificationPolicy.shouldPresent(
            userInfo: ["chatRoomId": 11],
            activeChatRoomID: 10
        )

        XCTAssertTrue(shouldPresent)
    }

    func testNotificationWithoutChatRoomIDIsPresented() {
        let shouldPresent = ForegroundNotificationPolicy.shouldPresent(
            userInfo: [:],
            activeChatRoomID: 10
        )

        XCTAssertTrue(shouldPresent)
    }
}
