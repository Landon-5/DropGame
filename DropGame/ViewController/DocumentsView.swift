//
//  DocumentsView.swift
//  DropGame
//
//  Created by Howard, Landon on 12/2/24.
//

import SwiftUI

struct DocumentsView: View 
{
    var body: some View 
    {
        NavigationLink("Game Dev Q", destination: CustomPDFView(displayedPDFURL: gameWork))
    }
}

#Preview ("Load all documents")
{
    DocumentsView()
}
