import SwiftUI

struct UnitTests: View {
    
    @StateObject private var viewModel: UnitTestingViewModel
    
    init(isPremium: Bool) {
        _viewModel = StateObject(wrappedValue: UnitTestingViewModel(isPremium: isPremium))
        
    }
    var body: some View {
        Text(viewModel.isPremium.description)
    }
}

struct UnitTests_Previews: PreviewProvider {
    static var previews: some View {
        UnitTests(isPremium: true)
    }
}
