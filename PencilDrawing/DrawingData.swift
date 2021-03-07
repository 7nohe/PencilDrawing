//
//  DrawingData.swift
//  PencilDrawing
//
//  Created by DAIKI URATA on 2021/03/06.
//

import Foundation
import PencilKit

public struct DrawingData {
    public var drawing: PKDrawing
    public var path: URL? = nil
    public var uuid = UUID()
}

public final class DrawingModel: ObservableObject {
    @Published var drawings: [DrawingData] = []
}


public func loadDrawings() -> [DrawingData] {
    let fileManager = FileManager.default
    let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    do {
        let files = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
        return try files.map {file -> DrawingData in
            let fileData = try Data(contentsOf: file)
            let result = try PKDrawing(data: fileData)
            let drawingData = DrawingData(drawing: result, path: file)
            return drawingData
        }
    } catch {
        print("Error while loading drawing files \(documentsURL.path): \(error.localizedDescription)")
        return []
    }
}


public func saveDrawing(url: URL?, contents: Data) -> Void {
    do {
        let fileManager = FileManager.default
        let docs = try fileManager.url(for: .documentDirectory,
                                       in: .userDomainMask,
                                       appropriateFor: nil, create: false)
        let uuid = UUID()
        let path = docs.appendingPathComponent("\(uuid).custom")
        if url != nil {
            try fileManager.removeItem(at: url!)
        }
        fileManager.createFile(atPath: path.path,
                               contents: contents, attributes: nil)
    } catch {
        print("Error while saving drawing file: \(error)")
    }
}

public func removeDrawing(url: URL) -> Void {
    do {
        let fileManager = FileManager.default
        try fileManager.removeItem(at: url)
    } catch {
        print("Error while removing drawing file: \(error)")
    }
}
