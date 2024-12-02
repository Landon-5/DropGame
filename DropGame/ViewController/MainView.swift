//
//  MainView.swift
//  DropGame
//
//  Created by Howard, Landon on 12/2/24.
//

import SwiftUI

struct MainView: View 
{
    var body: some View 
    {
        NavigationStack
        {
            NavigationLink("Game", destination: DropGameView())
            NavigationLink("Documents", destination: DocumentsView())
        }
    }
}

#Preview ("Options Screen")
{
    MainView()
}
