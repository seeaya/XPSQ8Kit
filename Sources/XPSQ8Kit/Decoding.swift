//
//  File.swift
//  
//
//  Created by Connor Barnes on 12/20/19.
//

import Foundation

// MARK: Decodable

protocol XPSQ8Decodable {
	init(xpsq8String: String) throws
}

// MARK: Decodable Types

// Further types can be made decodable by adding an extension adding conformance to XPSQ8Decodable.

extension String: XPSQ8Decodable {
	init(xpsq8String: String) throws {
		self = xpsq8String
	}
}

extension Int: XPSQ8Decodable {
	init(xpsq8String: String) throws {
		guard let integer = Int(xpsq8String) else { throw XPSQ8Communicator.Error.couldNotDecode }
		self = integer
	}
}

extension Double: XPSQ8Decodable {
	init(xpsq8String: String) throws {
		guard let double = Double(xpsq8String) else { throw XPSQ8Communicator.Error.couldNotDecode }
		self = double
	}
}

// MARK: Components

private extension XPSQ8Communicator {
	func readComponents() throws -> [String] {
		let (message, code) = try read()
		guard code == 0 else { throw Error.couldNotDecode }
		
		return message.split(separator: ",").map { String($0) }
	}
}

// MARK:
	
extension XPSQ8Communicator {
	// Swift does not support a variadic number of generic arguments, so a different function has to be made with each number of possible arguments. The largest number of arguments that a function returns is 16, so there are 16 different read functions (Right now there have only been 6 added)
	
	func read<T: XPSQ8Decodable>(as: T.Type) throws -> T {
		let components = try readComponents()
		guard components.count == 1 else { throw Error.couldNotDecode }
		
		return try T.init(xpsq8String: components[0])
	}
	
	func read<T0: XPSQ8Decodable, T1: XPSQ8Decodable>(as: (T0.Type, T1.Type)) throws -> (T0, T1) {
		let components = try readComponents()
		guard components.count == 2 else { throw Error.couldNotDecode }
		
		return try (T0.init(xpsq8String: components[0]),
								T1.init(xpsq8String: components[1]))
	}
	
	func read<T0: XPSQ8Decodable, T1: XPSQ8Decodable, T2: XPSQ8Decodable>(as: (T0.Type, T1.Type, T2.Type)) throws -> (T0, T1, T2) {
		let components = try readComponents()
		guard components.count == 3 else { throw Error.couldNotDecode }
		
		return try (T0.init(xpsq8String: components[0]),
								T1.init(xpsq8String: components[1]),
								T2.init(xpsq8String: components[2]))
	}
	
	func read<T0: XPSQ8Decodable, T1: XPSQ8Decodable, T2: XPSQ8Decodable, T3: XPSQ8Decodable>(as: (T0.Type, T1.Type, T2.Type, T3.Type)) throws -> (T0, T1, T2, T3) {
		let components = try readComponents()
		guard components.count == 4 else { throw Error.couldNotDecode }
		
		return try (T0.init(xpsq8String: components[0]),
								T1.init(xpsq8String: components[1]),
								T2.init(xpsq8String: components[2]),
								T3.init(xpsq8String: components[3]))
	}
	
	func read<T0: XPSQ8Decodable, T1: XPSQ8Decodable, T2: XPSQ8Decodable, T3: XPSQ8Decodable, T4: XPSQ8Decodable>(as: (T0.Type, T1.Type, T2.Type, T3.Type, T4.Type)) throws -> (T0, T1, T2, T3, T4) {
		let components = try readComponents()
		guard components.count == 5 else { throw Error.couldNotDecode }
		
		return try (T0.init(xpsq8String: components[0]),
								T1.init(xpsq8String: components[1]),
								T2.init(xpsq8String: components[2]),
								T3.init(xpsq8String: components[3]),
								T4.init(xpsq8String: components[4]))
	}
	
	func read<T0: XPSQ8Decodable, T1: XPSQ8Decodable, T2: XPSQ8Decodable, T3: XPSQ8Decodable, T4: XPSQ8Decodable, T5: XPSQ8Decodable>(as: (T0.Type, T1.Type, T2.Type, T3.Type, T4.Type, T5.Type)) throws -> (T0, T1, T2, T3, T4, T5) {
		let components = try readComponents()
		guard components.count == 6 else { throw Error.couldNotDecode }
		
		return try (T0.init(xpsq8String: components[0]),
								T1.init(xpsq8String: components[1]),
								T2.init(xpsq8String: components[2]),
								T3.init(xpsq8String: components[3]),
								T4.init(xpsq8String: components[4]),
								T5.init(xpsq8String: components[5]))
	}
}
