import SwiftUI

struct ProductItemView: View {
    let dataManager: DataManager
    @State var product: ProductJSON
    
    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
                let isFavorite = dataManager.favorites.contains(product)
                let url = URL(string: product.image)
                AsyncImage(url: url, content: { returnedImage in
                        returnedImage
                            .resizable()
                            .scaledToFit()
                            .staticFrame()
                            .cornerRadius(12)
                            .padding(.leading)
                }, placeholder: {
                    if let url = url, !url.absoluteString.isEmpty {
                           Color.gray
                               .opacity(0.5)
                               .frame(width: 100, height: 100)
                               .cornerRadius(12)
                               .padding(.leading)
                       } else {
                           ProgressView()
                       }
                })
                VStack(alignment: .leading) {
                    Text(product.title)
                        .fixedSize(horizontal: true, vertical: true)
                        .frame(width: 120)
                    
                    Spacer().frame(height: 20)
                    Text("\(product.price) \(product.currency.rawValue)")
                        .font(.system(size: 14, weight: .bold))
                }
                
                Spacer().frame(width: 80)
                HeartView(isFavorite: isFavorite) {
                                    dataManager.toggleFavorite(product)
                                    product.isFavorite = !product.isFavorite
                                    dataManager.loadFavorites()
                                }
                .offset(x: -30, y: 30)
            }
            .background(
                background
                .cornerRadius(12)
            )
        }
    }
    
    var background: some View {
        Rectangle()
            .fill(LinearGradient(colors: [
                Color.white,
                Color.gray.opacity(0.5)
            ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
              )
            )
            .frame(
                width: UIScreen.main.bounds.width,
                height: FrameSize.IMAGE_HEIGHT * 1.2
            )
            .cornerRadius(12)
    }
}
