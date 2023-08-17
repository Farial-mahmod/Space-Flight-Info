import Foundation

// here goes below the formation of information to be used
struct SpaceInfo : Codable, Identifiable {
  var id : Int
  var title : String
  var url : String
  var imageUrl : String
  var newsSite : String
  var summary : String
  var publishedAt: String
}

@MainActor class SpaceAPI : Observable {
  // 'news' will be populated with information as per the [SpaceInfo] format
  @Published var news : [SpaceInfo] : []

public func getData(){
  /* here comes the original URL as the source of data. One may customize the limit value to display a different number of articles. */
  guard let url = URL(string: "https://api.spaceflightnewsapi.net/v3/articles?_limit=13") else { return }

URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard let data = data else {
              // useful when data was unable to load
                let tempError = error!.localizedDescription
                DispatchQueue.main.async {
                    self.news = [SpaceInfo(id: 0, title: tempError, url: "Error", imageUrl: "Error", newsSite: "Error", summary: "Try swiping down to refresh as soon as you have internet again.", publishedAt: "Error")]
                }
                return }
  // decoding the raw  JSON format of data being fetched
  let spaceData = try! JSONDecoder().decode([SpaceInfo].self, from: data)

  // updating to the latest news
  DispatchQueue.main.async{
    print(spaceData.count)
    self.news = spaceData
  }
}.resume()
  
}
}
