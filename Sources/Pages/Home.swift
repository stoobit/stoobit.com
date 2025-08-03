import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    var body: some HTML {
        VStack(alignment: .leading, spacing: 20) {
            ForEach([
                Color.bootstrapOrange,
                Color.bootstrapBlue,
                Color.bootstrapGreen
            ]) { color in
                VStack {
                    Text("hi")
                }
                .frame(width: .vw(100%), height: .px(300))
                .background(color)
            }
        }
        .frame(width: .vw(100%))
        .ignorePageGutters()
    }
}
