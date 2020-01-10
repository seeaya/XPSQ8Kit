//
//  File.swift
//  
//
//  Created by Connor Barnes on 12/20/19.
//

// MARK: Types

public extension XPSQ8Controller {
	struct GlobalDoubleArray {
		weak var controller: XPSQ8Controller!
		
		/// Gets a value in the global double array at the given index.
		/// - Parameter index: The index of the array.
		public func get(at index: Int) throws -> Double {
			try controller.communicator.write(string: "DoubleGlobalArrayGet(\(index),double *)")
			return try controller.communicator.read(as: Double.self)
		}
		
		/// Sets a value in the global double array at the given index.
		/// - Parameters:
		///   - value: The new value to set.
		///   - index: The index of the array.
		public func set(to value: Double, at index: Int) throws {
			try controller.communicator.write(string: "DoubleGlobalArraySet(\(index),\(value))")
		}
	}
}
