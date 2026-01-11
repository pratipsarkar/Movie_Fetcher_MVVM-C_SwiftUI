//
//  AutomaticMovieFetchApp.swift
//  AutomaticMovieFetch
//
//  Created by Pratip Sarkar on 10/01/26.
//

import SwiftUI

@main
struct AutomaticMovieFetchApp: App {
    var body: some Scene {
        WindowGroup {
            let appCoordinator = MovieAppCoordinator()
            appCoordinator.start()
        }
    }
}
