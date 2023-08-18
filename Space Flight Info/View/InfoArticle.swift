import Foundation
import SwiftUI

struct InfoArticle : View {
  var title : String
  var imageURL : String
  var siteName : String
  var summary : String
  
  var body : some View {

    VStack(alignment: .leading){
      Text("\(title)")
      .italic()
      .foregroundColor(.blue)
// following is the image shape formation
      HStack(alignment: .center){
        CachedAsyncImage(url: URL(string: imageURL),  transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                            .transition(.opacity)
                    } else {
                      Image(systemname: "airplane.circle.fill")
                          }                                                                                    
    }
  }
// title of each article
      Text(title)
      .font(.headline)
      .padding(8)
      
// details of articles
      Text(summary)
      .lineLimit(6)
      .font(.body)
      .padding(8)
      
}
  }
}

struct InfoArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle(title: "Latest Flight Info", imageURL: "https://www.spaceflightnewsapi.net/", siteName: "Space Flight News", summary: "project by Farial Mahmod Tishan.")
    }
}
