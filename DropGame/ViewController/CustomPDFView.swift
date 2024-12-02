//
//  CustomPDFView.swift
//  AfternoonSystemsAndImpacts
//
//  Created by Howard, Landon on 9/20/24.
//

import SwiftUI
import PDFKit

struct CustomPDFView: View
{
    let displayedPDFURL : URL
    var body: some View
    {
        PDFKitRepresentedView(documentURL: displayedPDFURL)
            .accessibilityLabel("Displayed PDF")
            .accessibilityValue("Definitions of Computer Systems, Networking, and Hacking")
    }
}

struct PDFKitRepresentedView : UIViewRepresentable
{
    var documentURL : URL
    init (documentURL : URL)
    {
        self.documentURL = documentURL
    }
    
    func makeUIView (context : Context) -> some UIView
    {
        let pdfView : PDFView = PDFView()
        
        pdfView.document = PDFDocument(url: self.documentURL)
        pdfView.autoScales = true
        pdfView.displayDirection = .horizontal
        pdfView.minScaleFactor = 0.5
        pdfView.maxScaleFactor = 6.0
        
        return pdfView
    }
    
    func updateUIView(_ uiView : UIViewType, context : Context) -> Void
    {
        // No code in here
    }
}


#Preview ("Custom PDF View")
{
    CustomPDFView(displayedPDFURL: gameWork)
}
