//
//  ContentView.swift
//  PencilDrawing
//
//  Created by DAIKI URATA on 2021/03/01.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State private var canvasView: PKCanvasView = PKCanvasView()
    @State private var toolPicker: PKToolPicker = PKToolPicker()
        var body: some View {
            CanvasView(canvasView: self.$canvasView, toolPicker: self.$toolPicker)
        }
}
