//
//  File.swift
//  
//
//  Created by Connor Barnes on 1/13/20.
//

import Foundation
public extension XPSQ8Controller {
	// TODO: Fix groupName to thrown an error if the String is larger than 250 characters (instrument is limited to 250 character strings)
	struct GroupController {
		var controller: XPSQ8Controller
		//let globalGroupName: String
		//let stageName: String?
	}
}


// MARK: Access Gathering Namespace
public extension XPSQ8Controller {
	/// The set of commands dealing with globals.
//	func group(named name: String, stageName: String? = nil) -> GroupController {
//		return GroupController(controller: self, groupName: name)
//	}

	var group: GroupController {
		return GroupController(controller: self)
	}
}



// MARK: Functions
// void GroupMoveRelative(char groupName[250],double TargetDisplacement)
// func Group.moveRelative(targetDisplacement: Double)

public extension XPSQ8Controller.GroupController {
	/*func groupName () -> String {
		if let stageName = stageName {
			return globalGroupName + "." + stageName
		}
		else {
			return globalGroupName
		}
	}
*/
	
	
	func moveRelative(groupName: String, targetDisplacment: Double) throws {
		let command = "GroupMoveRelative( \(groupName), \(targetDisplacment)"
		
		try controller.communicator.write(string: command)
		try controller.communicator.validateNoReturn()
	}
}

