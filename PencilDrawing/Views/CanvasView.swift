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
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 50)
        canvasView.drawingGestureRecognizer.isEnabled = true
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 20)
        canvasView.drawingPolicy = .anyInput
        canvasView.backgroundColor = .white
        toolPicker.addObserver(canvasView)
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        canvasView.becomeFirstResponder()
        
        
        //        Navigation Bar
        let navBar = UINavigationBar()
        navBar.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50)
        navBar.backgroundColor = .lightGray
        canvasView.addSubview(navBar)
        let navItem: UINavigationItem = UINavigationItem(title: "タイトル")
        navItem.rightBarButtonItems = [
            UIBarButtonItem(title: "保存", style:UIBarButtonItem.Style.plain, target:self, action: nil)
        ]
        navItem.leftBarButtonItems = [
            UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style:UIBarButtonItem.Style.plain, target:self, action: nil)
        ]
        navBar.pushItem(navItem, animated: true)
        
        return canvasView
    }
    
    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}

struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper()
    }
    
    struct PreviewWrapper: View {
        @State private var canvasView: PKCanvasView = PKCanvasView()
        @State private var toolPicker: PKToolPicker = PKToolPicker()
        var body: some View {
            CanvasView(canvasView: $canvasView, toolPicker: $toolPicker)
        }
    }
}
