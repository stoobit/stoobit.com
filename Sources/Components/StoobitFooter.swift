//
//  StoobitFooter.swift
//  stoobit.com
//
//  Created by Till Brügmann on 02.08.25.
//

import Ignite

struct StoobitFooter: HTML {
    let icons = [
        Image(systemName: "github"),
        Image(systemName: "twitter"),
        Image(systemName: "youtube"),
        Image(systemName: "mastodon")
    ]

    let urlStrings = [
        "https://github.com/twostraws",
        "https://twitter.com/twostraws",
        "https://youtube.com/@twostraws",
        "https://mastodon.social/@twostraws"
    ]

    var body: some HTML {
        VStack {
            HStack {
                ForEach(zip(icons, urlStrings)) { (icon, urlString) in
                    Link(icon, target: urlString)
                        .role(.secondary)
                        .target(.blank)
                        .relationship(.noOpener, .noReferrer)
                }
            }
        }
        .margin(.top, .xLarge)
        .font(.title2)
    }
}
