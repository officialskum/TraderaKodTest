import SwiftUI

struct FavoritesView: View {
    @ObservedObject var dataManager: DataManager
    
    var body: some View {
        if (dataManager.feed?.products.isEmpty ?? true) {
            Spacer().frame(height: 40)
            Text("You haven't favorited any products yet.")
                .font(.headline)
        } else {
            List {
                ForEach(dataManager.favorites, id: \.self) { favorites in
                    ProductItemView(dataManager: dataManager, product: favorites)
                }
            }
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(dataManager: DataManager())
    }
}
