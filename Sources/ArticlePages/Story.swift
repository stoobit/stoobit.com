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
                
                Text("\(article.estimatedWordCount) Words • \(article.estimatedReadingMinutes) Minutes to Read"
                )
                .foregroundStyle(Color.gray)
            }
            
            if let image = article.image {
                Image(image, description: article.imageDescription)
                    .resizable()
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(article.text)
                
                if let tags = article.tags {
                    VStack(alignment: .center) {
                        Text("\(tags.map { "#\($0)" }.joined(separator: " "))")
                            .foregroundStyle(Color.bootstrapBlue)
                    }
                    .frame(width: .percent(100%))
                }
            }
            .frame(width: .percent(100%))
        }
        .frame(width: .percent(100%))
        .padding(40)
    }
}
