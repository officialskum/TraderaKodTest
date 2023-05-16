import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @StateObject var dataManager = DataManager()
    
    var body: some View {
            NavigationView {
                VStack {
                    if selectedTab == 0 {
                        ProductsView(dataManager: dataManager)
                    } else {
                        FavoritesView(dataManager: dataManager)
                    }
                    Spacer()
                }
                .navigationTitle(selectedTab == 0 ? "Products" : "Favorites")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button(action: {
                            selectedTab = 0
                        }) {
                            Image(systemName: "cart")
                            Text("Product")
                        }
                        .accentColor(selectedTab == 0 ? .blue : .gray)
                        
                        Button(action: {
                            selectedTab = 1
                        }) {
                            Image(systemName: "star")
                            Text("Favorite")
                        }
                        .accentColor(selectedTab == 1 ? .blue : .gray)
                    }
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
