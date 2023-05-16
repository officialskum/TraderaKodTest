import Foundation
import SwiftUI 

struct FrameSize {
    static let IMAGE_WIDTH: CGFloat = 80
    static let IMAGE_HEIGHT: CGFloat = 100
}

extension View {
    func staticFrame() -> some View {
        self.frame(width: FrameSize.IMAGE_WIDTH, height: FrameSize.IMAGE_HEIGHT)
    }
}

