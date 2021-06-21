//
//  ContentView.swift
//  SwiftUICoreDataViewModelNavigationView
//
//  Created by Kim Hansen on 21/06/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ViewModel.shared
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationView {
            VStack {
                Text(model.currentTime)
                NavigationLink(destination: DetailView()) {
                    Text("Detail view 1")
                }
                NavigationLink(destination: DetailView()) {
                    Text("Detail view 2")
                }
            }
            .onReceive(timer) { (_) in
                let context = CoreDataStack.shared.workingContext
                let item = Item(context: context)
                item.name = "test"
                CoreDataStack.shared.saveWorkingContext(context: context)
            }
        }
    }
}
