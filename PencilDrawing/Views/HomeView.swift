//
//  HomeView.swift
//  PencilDrawing
//
//  Created by DAIKI URATA on 2021/03/03.
//

import SwiftUI
import PencilKit

struct HomeView: View {
    @State private var canvasView: PKCanvasView = PKCanvasView()
    @State private var toolPicker: PKToolPicker = PKToolPicker()
    @State private var isCanvasOpened = false
    var body: some View {
        if isCanvasOpened {
            ZStack {
                CanvasView(canvasView: $canvasView, toolPicker: $toolPicker)
                    .navigationBarTitle("NavigationBar", displayMode: .inline)
            }
        } else {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation() {
                            isCanvasOpened.toggle()
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50.0, height: 50.0, alignment: .leading)
                    }
                    .accentColor(.blue)
                    .shadow(color: Color.black, radius: 1, x: 0, y: 0)
                }
            }.padding(30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
