import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    var body: some HTML {
        VStack(alignment: .leading) {
            Text("Hello world!")
                .font(.title1)
            
            Image(systemName: "house")
            
            Text("Hello world!")
                .foregroundStyle(Color.red)
                .font(.title3)
        }
        .frame(maxWidth: .vw(100%), maxHeight: .vh(100%))
        .background(Color.red)
        .ignorePageGutters()
    }
}
