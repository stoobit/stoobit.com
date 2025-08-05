//
// Story.swift
// IgniteSamples
// https://www.github.com/twostraws/Ignite
// See LICENSE for license information.
//

import Foundation
import Ignite

struct Story: ArticlePage {
    var body: some HTML {
        VStack(alignment: .leading, spacing: 25) {
            VStack(alignment: .leading) {
                Text(article.title)
                    .font(.title2)
                
                Span {
                    let count = article.estimatedWordCount
                    let minutes = article.estimatedReadingMinutes
                    "\(count) Words • \(minutes) Minutes to Read • "
                    
                    if let tags = article.tags {
                        "\(tags.map { "#\($0)" }.joined(separator: " "))"
                    }
                }
                .foregroundStyle(Color.gray)
            }
            
            if let image = article.image {
                Image(image, description: article.imageDescription)
                    .resizable()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(article.text)
                
                VStack(alignment: .center) {
                    Link(target: "/blog") {
                        Span("All Posts")
                    }
                    .style(.display, "inline-block")
                    .style(.padding, "10px 24px")
                    .style(.backgroundColor, "#007BFF")
                    .style(.color, "white")
                    .style(.textDecoration, "none")
                    .style(.borderRadius, "9999px")
                    .style(.fontWeight, "600")
                    .frame(width: .px(150))
                    .style(.textAlign, "center")
                }
                .frame(width: .percent(100%))
            }
            .frame(width: .percent(100%))
        }
        .frame(width: .percent(100%))
        .padding(40)
    }
}
