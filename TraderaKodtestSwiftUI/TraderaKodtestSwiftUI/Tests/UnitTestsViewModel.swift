import SwiftUI
import Foundation

class UnitTestingViewModel: ObservableObject {
    @Published var isPremium: Bool
    
    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
}

