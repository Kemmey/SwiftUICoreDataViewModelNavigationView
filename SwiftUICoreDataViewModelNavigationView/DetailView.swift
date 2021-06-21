//
//  ContentView.swift
//  SharedCoreDataTest
//
//  Created by Kim Hansen on 18/06/2021.
//

import SwiftUI
import CoreData

struct DetailView: View {
    @FetchRequest(entity: Item.entity(), sortDescriptors: []) private var items: FetchedResults<Item>
    var body: some View {
        Text("Items count: \(items.count)")
    }
    
}
