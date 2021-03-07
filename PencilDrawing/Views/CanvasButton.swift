//
//  CanvasCloseButton.swift
//  PencilDrawing
//
//  Created by DAIKI URATA on 2021/03/05.
//

import UIKit
import SwiftUI

class CanvasButton: UIBarButtonItem {
    private var onPress: () -> Void
    init(onPress: @escaping () -> Void) {
        self.onPress = onPress
        super.init()
        self.style = UIBarButtonItem.Style.plain
        self.target = self
        self.action = #selector(buttonAction)
    }
    
    required init?(coder: NSCoder, onPress: @escaping () -> Void) {
        self.onPress = onPress
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonAction() {
        onPress()
    }
}
