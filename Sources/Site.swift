import Foundation
import Ignite

@main
struct IgniteWebsite {
    static func main() async {
        var site = StoobitWebsite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct StoobitWebsite: Site {
    var name = "Hello World"
    var titleSuffix = " – My Awesome Site"
    var url = URL(static: "https://www.example.com")
    var builtInIconsEnabled = true
    
    var darkTheme: (any Theme)? = nil

    var author = "John Appleseed"

    var homePage = Home()
    var layout = MainLayout()
}
