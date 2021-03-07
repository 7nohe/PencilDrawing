//
//  ContentView.swift
//  PencilDrawing
//
//  Created by DAIKI URATA on 2021/03/01.
//

import SwiftUI
import PencilKit

struct ContentView: View {
    @State private var showCanvas = false
    @State private var canvasView: PKCanvasView = PKCanvasView()
    @State private var toolPicker: PKToolPicker = PKToolPicker()
    @State private var canvasURL: URL?
    @EnvironmentObject var drawingModel: DrawingModel
    var body: some View {
        NavigationView {
            if showCanvas {
                CanvasView(canvasView: self.$canvasView, toolPicker: self.$toolPicker, showCanvas: $showCanvas, canvasURL: $canvasURL)
                    .navigationBarTitle("Canvas", displayMode: .inline)
                    .navigationBarItems(
                        leading: Button(action: {
                            showCanvas = false
                        }){
                            Image(systemName: "arrow.backward")
                        },
                        trailing: HStack {
                            if canvasURL != nil {
                                Button(action: {
                                    removeDrawing(url: canvasURL!)
                                    canvasURL = nil
                                    showCanvas = false
                                }) {
                                    Image(systemName: "trash")
                                }.padding()
                            }
                            Button(action: {
                                saveDrawing(url: canvasURL, contents: canvasView.drawing.dataRepresentation())
                                canvasView.drawing = PKDrawing()
                                canvasURL = nil
                                showCanvas = false
                            }) {
                                Image(systemName: "checkmark")
                            }
                            
                        })
                    .environmentObject(drawingModel)
            } else {
                HomeView(showCanvas: $showCanvas, canvasView: $canvasView, canvasURL: $canvasURL)
                    .navigationBarItems(
                        trailing: Button(action: {
                        }) {
                            Image(systemName: "bell")
                        })
                    .navigationBarTitle("Home", displayMode: .inline)
                    .onAppear(perform: {
                        drawingModel.drawings = loadDrawings()
                        
                    })
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(DrawingModel())
    }
}
