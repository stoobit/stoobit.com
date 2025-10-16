//
//  Support Me.swift
//  stoobit.com
//
//  Created by Till Brügmann on 03.08.25.
//

import Ignite
import Foundation

struct SupportMe: StaticPage {
    @Environment(\.articles) var articles
    
    var title = "Support Me"

    var body: some HTML {
        VStack(alignment: .leading, spacing: 30) {
            Text("Blog")
                .font(.title1)
                .fontWeight(.bold)
                .padding(.leading, 20)
           
            Grid(spacing: 15) {
                ForEach(articles.all.sorted {
                    $0.title.lowercased() < $1.title.lowercased()
                }) { article in
                    VStack {
                        ZStack {
                            Image(decorative: "/assets/post.svg")
                                .resizable()
                                .frame(
                                    width: .percent(60%),
                                    height: .px(160)
                                )
                                .style(.objectFit, "contain")
                        }
                        .frame(minWidth: .percent(100%), minHeight: .px(250))
                        .background(Gradient(colors: [
                            Color(hex: "#008AFF"),
                            Color(hex: "#00D3FF")
                        ], type: .linear(angle: 0)))
                        
                        VStack(spacing: 35) {
                            VStack(alignment: .leading) {
                                Text(article.title)
                                    .font(.title3)
                                    .fontWeight(.bold)
                                
                                if let author = article.author {
                                    Text("\(author), \(format(article.date))")
                                        .foregroundStyle(Color.gray)
                                }
                            }
                            .frame(minWidth: .percent(100%))
                            
                            VStack(spacing: 10) {
                                let buttonWidth: Int = 250
                                
                                Link(target: article) {
                                    Span("Read Article")
                                }
                                .style(.display, "inline-block")
                                .frame(width: buttonWidth)
                                .style(.padding, "10px 24px")
                                .style(.backgroundColor, "#007BFF")
                                .style(.color, "white")
                                .style(.textDecoration, "none")
                                .style(.borderRadius, "9999px")
                                .style(.fontWeight, "600")
                                .style(.textAlign, "center")
                                .border(Color.bootstrapBlue, width: 2)
                                
                                Text(tagString(article: article))
                                    .foregroundStyle(Color.gray)
                                    .font(.small)
                            }
                        }
                        .frame(minWidth: .percent(100%))
                        .padding(20)
                    }
                    .frame(minWidth: .px(330))
                    .clipped()
                    .cornerRadius(27)
                    .background(Color(hex: "#F5F5F8"))
                    .margin(15)
                }
            }
        }
        .padding(.vertical, 40)
    }
    
    func tagString(article: Article) -> String {
        var string = ""
        
        if let tags = article.tags {
            for (index, app) in tags.sorted().enumerated() {
                string += app
                if index < tags.count - 1 {
                    string += "  •  "
                }
            }
        }
        
        return string
    }
    
    func format(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "de_DE")
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
}
