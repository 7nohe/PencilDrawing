//
//  HomeView.swift
//  PencilDrawing
//
//  Created by DAIKI URATA on 2021/03/03.
//

import SwiftUI
import PencilKit

struct HomeView: View {
    @Binding var showCanvas: Bool
    @Binding var canvasView: PKCanvasView
    @Binding var canvasURL: URL?
    @EnvironmentObject var drawingModel: DrawingModel
    @State var gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: gridLayout, spacing: 20) {
                        ForEach(drawingModel.drawings, id: \.uuid) { model in
                            RoundedRectangle(cornerRadius: 10)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .frame(width: 200, height: 300, alignment: .leading)
                                .foregroundColor(.white)
                                .overlay(
                                    Image(uiImage: model.drawing.image(from: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), scale: 1))
                                        .resizable()
                                        
                                        .onTapGesture {
                                            canvasView.drawing = model.drawing
                                            canvasURL = model.path
                                            withAnimation() {
                                                showCanvas.toggle()
                                            }
                                        }
                                )
                        }.padding(.all, 30)
                        
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                                        
                            Button(action: {
                                canvasView.drawing = PKDrawing()
                                withAnimation() {
                                    showCanvas.toggle()
                                }
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .resizable()
                                    .frame(width: 50.0, height: 50.0, alignment: .leading)
                                    .background(Color.white)
                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                    .shadow(color: Color.black, radius: 1, x: 0, y: 0)
                            }
                            .accentColor(.blue)
                        }
                        
                }.padding(30)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper().environmentObject(DrawingModel())
    }
    
    struct PreviewWrapper: View {
        @State private var showCanvas = false
        @State var canvasView: PKCanvasView = PKCanvasView()
        @State var canvasURL: URL? = nil
        var body: some View {
            HomeView(showCanvas: $showCanvas, canvasView: $canvasView, canvasURL: $canvasURL)
        }
    }
}

