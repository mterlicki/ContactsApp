//
//  LaunchArgumentsHandler.swift
//  CoreDataDemo
//
//  Created by Michal Terlicki on 10/04/2022.
//

import Foundation

struct LaunchArgumentsHandler {
    let userDefaults: UserDefaults

    func handle() {
        resetIfNeeded()
        addContactsIfNeeded()
    }

    private func resetIfNeeded() {
        guard CommandLine.arguments.contains("-reset") else {
            return
        }

        let defaultsName = Bundle.main.bundleIdentifier!
        userDefaults.removePersistentDomain(forName: defaultsName)
    }

    private func addContactsIfNeeded() {
        guard let argument = userDefaults.string(forKey: "contacts") else {
            return
        }
    }
    
    
}
