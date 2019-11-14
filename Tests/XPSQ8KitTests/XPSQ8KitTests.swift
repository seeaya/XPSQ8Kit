import XCTest
@testable import XPSQ8Kit

final class XPSQ8KitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(XPSQ8Kit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
