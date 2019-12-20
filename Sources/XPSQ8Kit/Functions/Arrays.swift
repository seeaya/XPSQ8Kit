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
		
		/// Gets or sets a value in the controller's global double array.
		///
		/// - Note: This method does not throw – if an invalid index is given, or the controller could not be read from or written to, it will result in a fatal error.
		// The method does not throw because Swift does not allow throwing from a subscript.
		public subscript(index: Int) -> Double {
			get {
				try! self.controller.communicator.write(string: "DoubleGlobalArrayGet(\(index),double *)")
				return try! self.controller.communicator.read(as: Double.self)
			}
			set {
				try! self.controller.communicator.write(string: "DoubleGlobalArraySet(\(index),\(newValue))")
			}
		}
	}
}
