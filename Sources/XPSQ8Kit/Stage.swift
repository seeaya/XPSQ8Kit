//
//  File.swift
//  
//
//  Created by Connor Barnes on 1/13/20.
//

import Foundation

struct Stage {
	let controller: XPSQ8Controller.GroupController
	let stageName: String
	
	let groupName {
		get {
			return controller.globalGroupName + "." + stageName
		}
	}
	
}
