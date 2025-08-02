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
            Dropdown {
                
            } title: {
                Span("Key concepts")
                    .foregroundStyle(.white)
            }

            Dropdown {
                
            } title: {
                Span("Examples")
                    .foregroundStyle(.white)
            }

            Link(target: "https://github.com/twostraws/Ignite") {
                Span("Ignite on GitHub")
                    .foregroundStyle(.white)
            }
        } logo: {
            Image("/images/logo.svg", description: "ExampleSite logo")
                .frame(width: .custom("min(60vw, 300px)"), height: .percent(100%))
        }
        .navigationItemAlignment(.trailing)
        .background(.firebrick)
        .position(.fixedTop)
    }
}
