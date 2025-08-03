//
//  StoobitFooter.swift
//  stoobit.com
//
//  Created by Till Brügmann on 02.08.25.
//

import Foundation
import Ignite

struct StoobitFooter: HTML {
    let categories: [FooterCategory] = [
        FooterCategory(
            title: "Find Me Online",
            links: [
                FooterLink(
                    title: "X",
                    target: "https://x.com/stoobitofficial",
                    openNew: true
                ),
                FooterLink(
                    title: "AppStore",
                    target: "https://apps.apple.com/us/developer/petra-bruegmann/id1690039205",
                    openNew: true
                ),
                FooterLink(
                    title: "GitHub",
                    target: "https://github.com/stoobit",
                    openNew: true
                )
            ]
        ),
        FooterCategory(
            title: "Information",
            links: [
                FooterLink(
                    title: "About Me",
                    target: AboutMe().path
                ),
                FooterLink(
                    title: "Privacy Policy",
                    target: PrivacyPolicy().path
                ),
                FooterLink(
                    title: "Legal Notice",
                    target: LegalNotice().path
                )
            ]
        ),
    ]

    var body: some HTML {
        VStack(spacing: 20) {
            HStack {
                ForEach(categories) { category in
                    VStack(alignment: .center) {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(category.title)
                                .fontWeight(.bold)
                            
                            ForEach(category.links) { link in
                                Link(link.title, target: link.target)
                                    .role(.none)
                                    .target(
                                        link.openNew ? .blank : .default
                                    )
                            }
                        }
                    }
                    .frame(width: .vw((100 / categories.count)%))
                }
            }
            .padding(.vertical, 35)
            
            Text("Copyright © \(year) Till Brügmann")
                .foregroundStyle(Color.gray)
                .font(.small)
                .padding(.bottom, 15)
        }
        .background(Color(hex: "#F5F5F8"))
        .ignorePageGutters()
    }
    
    var year: Int {
        return Calendar.current.component(
            .year, from: Date()
        )
    }
}



struct FooterCategory {
    var title: String
    var links: [FooterLink]
}

struct FooterLink {
    var title: String
    var target: String
    
    var openNew: Bool = false
}
