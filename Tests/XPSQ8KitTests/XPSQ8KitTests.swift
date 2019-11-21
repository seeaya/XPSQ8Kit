import XCTest
@testable import XPSQ8Kit

final class XPSQ8KitTests: XCTestCase {
	
	static var communicator: XPSQ8Communicator!
	var communicator: XPSQ8Communicator! {
		return XPSQ8KitTests.communicator
	}
	
	override class func setUp() {
		communicator = try? .init(address: "192.168.0.254", port: 5001, timeout: 5.0)
	}
	
	func testConnectToInstrument() {
		XCTAssertNotNil(communicator, "Could not create communicator.")
	}
	
	func testGetTimeElapsed() {
		guard let communicator = communicator else {
			XCTFail("Could not create communicator.")
			return
		}
		
		do {
			try communicator.write(string: "ElapsedTimeGet(double *)")
		} catch {
			XCTFail("Could not write.")
			return
		}
		
		let message: String
		let code: Int
		
		do {
			(message, code) = try communicator.read()
		} catch {
			XCTFail("Could not read.")
			return
		}
		
		print("Message: \(message)")
		print("Code: \(code)")
	}
	
	static var allTests = [
		("testConnectToInstrument", testConnectToInstrument),
		("testGetTimeElapsed", testGetTimeElapsed),
	]
}
