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
    var name = "stoobit"
    var titleSuffix = " – stoobit"
    var url = URL(static: "https://www.stoobit.com")
    let favicon = URL(static: "https://www.stoobit.com/assets/favicon.png")
    
    var builtInIconsEnabled = true
    var syntaxHighlighterConfiguration: SyntaxHighlighterConfiguration = .init(
        languages: [.swift, .python, .go]
    )
    
    var darkTheme: (any Theme)? = nil

    var author = "Till Brügmann"
    var robotsConfiguration = StoobitRobots()

    var homePage = Home()
    var layout = MainLayout()
    
    var staticPages: [any StaticPage] {
        // Information Pages
        AboutMe()
        LegalNotice()
        PrivacyPolicy()
        
        // Content Pages
        Projects()
        Blog()
    }
}

struct StoobitRobots: RobotsConfiguration {
    var disallowRules: [DisallowRule]

    init() {
        let paths = [
            "/about-me",
            "/legal-notice",
            "/privacy-policy",
        ]

        disallowRules = [
            DisallowRule(robot: .google, paths: paths),
            DisallowRule(robot: .bing, paths: paths),
            DisallowRule(robot: .chatGPT)
        ]
    }
}
