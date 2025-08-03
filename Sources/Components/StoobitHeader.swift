//
//  StoobitHeader.swift
//  stoobit.com
//
//  Created by Till Brügmann on 02.08.25.
//

import Ignite

struct StoobitHeader: HTML {
    var body: some HTML {
        NavigationBar {
            Link(Span("Projects"), target: Projects())
            Link(Span("Blog"), target: Blog())
            
            Link(target: "mailto:till.bruegmann@stoobit.com") {
                Span("Contact")
            }
        } logo: {
            Span {
                Span("stoo")
                    .foregroundStyle(Color.black)
                
                Span("bit")
                    .foregroundStyle(Color(hex: "#4169e1"))
            }
            .font(.title4)
            .fontWeight(.bold)
        }
        .navigationItemAlignment(.trailing)
        .navigationMenuStyle(.plain)
        .navigationMenuIcon(.ellipsis)
        .frame(minHeight: .px(60))
        .style(.background, "rgba(255, 255, 255, 0.6)")
        .style(.backdropFilter, "blur(10px)")
        .position(.fixedTop)
    }
}
