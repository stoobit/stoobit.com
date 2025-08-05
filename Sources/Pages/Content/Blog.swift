//
//  Blog.swift
//  stoobit.com
//
//  Created by Till Brügmann on 03.08.25.
//

import Ignite

struct Blog: StaticPage {
    @Environment(\.articles) var articles
    
    var title = "Blog"
    var description = ""

    var body: some HTML {
        List {
            ForEach(articles.all) { article in
                Link(article)
            }
        }
    }
}
