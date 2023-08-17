import Foundation

struct InfoView : View {

  // object of class SpaceAPI declared in APIFormation.swift
  @EnvironmentObject var data = SpaceAPI
  // variable to open URLs in the system browser
  @Environment(\.openURL) var openURL

  var body : some View {
    List {
      ForEach(data.news){ news in
        // looping through the articles with specific information
        InfoArticle(
          title: news.title,
          imageURL: news.imageUrl,
          siteName: news.newsSite,
          summary: news.summary
        )
        // clicks redirect to specific URLs
        .onTapGesture{
        openURL(URL(string: news.url)!)
                     }
      }
    }
    // this marks a view as refreshable
    .refreshable{
      data.getData()
    }
  }

}
// preview
    struct InfoView_Previews: PreviewProvider {
        static var previews: some View {
            InfoView()
                .environmentObject(SpaceAPI())
        }
    }
