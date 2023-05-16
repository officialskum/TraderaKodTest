import SwiftUI

struct Quote: Codable {
    var quote_id: Int
    var quote: String
    var author: String
    var series: String
}

struct AsyncTestFetch: View {
    @State private var quotes = [Quote]()
    
    var body: some View {
        NavigationView{
            List(quotes, id: \.quote_id) { quote in
                VStack(alignment: .leading){
                    Text(quote.author)
                        .font(.headline)
                    Text(quote.quote)
                        .font(.body)
                }
            }
            .navigationTitle("Quotes")
            .task {
                await fetchData()
            }
        }
    }
    
    func fetchData() async {
//        guard let url = URL(string: "https://www.breakingbadapi.com/api/quotes") else {
//            print("Error: URL isn't valid.")
//            return
//        }
        
        guard let url = URL(string: "https://www.tradera.com/static/images/NO_REV/frontend-task/ProductFeedResult.json") else { return }
        // Fetch data from url
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Decode data
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data) {
                DispatchQueue.main.async {
                    quotes = decodedResponse
                }
            }
        } catch {
            print("Error: this data isn't valid.")
        }
    }
}

struct AsyncTestFetch_Previews: PreviewProvider {
    static var previews: some View {
        AsyncTestFetch()
    }
}
