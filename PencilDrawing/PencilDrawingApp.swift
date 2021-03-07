//
//  PencilDrawingApp.swift
//  PencilDrawing
//
//  Created by DAIKI URATA on 2021/03/01.
//

import SwiftUI

@main
struct PencilDrawingApp: App {
    @StateObject private var drawingModel = DrawingModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(drawingModel)
        }
    }
}
