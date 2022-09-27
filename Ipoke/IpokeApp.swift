//
//  IpokeApp.swift
//  Ipoke
//
//  Created by user226765 on 9/27/22.
//

import SwiftUI

@main
struct IpokeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(PokeController())
        }
    }
}
