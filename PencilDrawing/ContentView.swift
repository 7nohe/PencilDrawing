//
//  ContentView.swift
//  PencilDrawing
//
//  Created by DAIKI URATA on 2021/03/01.
//

import SwiftUI
import PencilKit

struct ContentView: View {
//    @State private var canvasView: PKCanvasView = PKCanvasView()
//    @State private var toolPicker: PKToolPicker = PKToolPicker()
    @State private var tabSelection = 0
        var body: some View {
            TabView(selection: $tabSelection) {
                HomeView().tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }.tag(1)
                BooksView().tabItem {
                    Image(systemName: "books.vertical")
                    Text("Books")
                }.tag(2)
                MenuView().tabItem {
                    Image(systemName: "text.justify")
                    Text("Menu")
                }.tag(3)
            }
//            CanvasView(canvasView: self.$canvasView, toolPicker: self.$toolPicker)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
