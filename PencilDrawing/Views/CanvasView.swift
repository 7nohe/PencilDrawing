//
//  CanvasView.swift
//  PencilDrawing
//
//  Created by DAIKI URATA on 2021/03/01.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    @Binding var toolPicker: PKToolPicker
    
    func makeUIView(context: Context) -> PKCanvasView {
        
        self.canvasView.drawingGestureRecognizer.isEnabled = true
        self.canvasView.tool = PKInkingTool(.pen, color: .black, width: 20)
        self.canvasView.drawingPolicy = .anyInput
        self.canvasView.backgroundColor = .white
        toolPicker.addObserver(self.canvasView)
        toolPicker.setVisible(true, forFirstResponder: self.canvasView)
        self.canvasView.becomeFirstResponder()
            
        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}
