//
//  LaunchArgumentsHandler.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 10/04/2022.
//

import Foundation

struct LaunchArgumentsHandler {

    func handle() {
        setUpCoreData()
    }
    
    private func setUpCoreData() {
        guard CommandLine.arguments.contains("-UITesting") else
        {
            return
        }
        
        print("Seting core data")
    }
    
}
