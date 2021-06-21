//
//  ContentView.swift
//  SharedCoreDataTest
//
//  Created by Kim Hansen on 18/06/2021.
//

import SwiftUI
import CoreData

class ViewModel: ObservableObject {
    static let shared = ViewModel()

    init()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNewDataAvailable(notification:)), name: .newDataAvailable, object: nil)
    }
    deinit
    {
        NotificationCenter.default.removeObserver(self)
    }


    @Published var currentTime: String = ""

    @objc func handleNewDataAvailable(notification: Notification) {
        DispatchQueue.main.async {
            self.currentTime = Date().description
        }
    }

}

