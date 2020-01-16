//
//  File.swift
//  
//
//  Created by Connor Barnes on 1/13/20.
//

import Foundation

class Stage {
	let controller: XPSQ8Controller.GroupController
	let stageName: String
	
	public init(controller: XPSQ8Controller.GroupController, stageName: String) {
		self.controller = controller
		self.stageName = stageName
	}
	
	var groupName:String {
		get {
			return controller.globalGroupName + "." + stageName
		}
	}
	
}
