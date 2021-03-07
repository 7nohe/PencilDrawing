//
//  CanvasView.swift
//  PencilDrawing
//
//  Created by DAIKI URATA on 2021/03/01.
//

import SwiftUI
import PencilKit
import UIKit

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    @Binding var toolPicker: PKToolPicker
    @Binding var showCanvas: Bool
    @Binding var canvasURL: URL?
    @EnvironmentObject var drawingModel: DrawingModel
    
    
    func makeUIView(context: Context) -> PKCanvasView {
//        canvasView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50)
        canvasView.frame = .zero
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.isOpaque = false
        canvasView.drawingGestureRecognizer.isEnabled = true
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 20)
        canvasView.drawingPolicy = .anyInput
        canvasView.backgroundColor = .clear
        toolPicker.addObserver(canvasView)
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        canvasView.becomeFirstResponder()
        
        return canvasView
    }
    
    func toggleShowCanvas() {
        showCanvas.toggle()
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewWrapper()
        }
    }
    
    struct PreviewWrapper: View {
        @State private var canvasView: PKCanvasView = PKCanvasView()
        @State private var toolPicker: PKToolPicker = PKToolPicker()
        @State private var showCanvas = false
        @State private var canvasURL: URL? = nil
        var body: some View {
            CanvasView(canvasView: $canvasView, toolPicker: $toolPicker, showCanvas: $showCanvas, canvasURL: $canvasURL)
        }
    }
}
