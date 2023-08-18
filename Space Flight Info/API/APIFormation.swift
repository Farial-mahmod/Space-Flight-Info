import Foundation

// SpaceInfo is the formation (properties) of API-data to be fetched
struct SpaceInfo : Codable, Identifiable {
    var id: Int
    var title: String
    var url: String
    var imageUrl: String
    var newsSite: String
    var summary: String
    var publishedAt: String
}

// SpaceAPI is the main performer class in this project
@MainActor class SpaceAPI: ObservableObject {
  
  // news variable contains the array-shaped data of flights that are fetched and formatted
    @Published var news: [SpaceInfo] = []
    
    func getData() {
      // url has the URL of data source. One may change the limit value if necessary.
        guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=10") else { return }

      // URLSession to handle API actions
        URLSession.shared.dataTask(with: url) { (data, response, error) in
                                               
            // to return an error object if data is unavailable
            guard let data = data else {
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [SpaceData(id: 0, title: tempError, url: "Error", imageUrl: "Error", newsSite: "Error", summary: "Try swiping down to refresh as soon as you have internet again.", publishedAt: "Error")]
                }
                return }
            // JSON decoding
            let spaceData = try! JSONDecoder().decode([SpaceData].self, from: data)
            
            // Updating to the latest data on the main thread asynchronously
            DispatchQueue.main.async {
                print(spaceData.count)
                self.news = spaceData
            }
        }.resume()
    }
}

// an API formation would not require a preview - unlike other view screens
