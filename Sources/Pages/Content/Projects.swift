//
//  Projects.swift
//  stoobit.com
//
//  Created by Till Brügmann on 03.08.25.
//

import Ignite

struct Projects: StaticPage {
    var title = "Projects"
    var description = ""
    
    var body: some HTML {
        VStack(alignment: .leading, spacing: 30) {
            Text("Projects")
                .font(.title1)
                .fontWeight(.bold)

            Grid(spacing: 20) {
                ForEach(projects) { project in
                    VStack {
                        Text("Hi")
                    }
                    .frame(minWidth: .px(330), minHeight: .px(600))
                    .style(.borderRadius, "30px")
                    .background(Color(hex: "#F5F5F8"))
                }
            }
        }
        .padding(40)
        .ignorePageGutters()
        
        Modal(id: "dismissModalId") {
            Section {
                Button().role(.close).onClick {
                    DismissModal(id: "dismissModalId")
                }
            }
            .horizontalAlignment(.trailing)

            Text("Dismiss me by clicking on the close button.")
                .horizontalAlignment(.center)
                .font(.title3)
                .margin(.xLarge)
        }
        .size(.xLarge)
    }
    
    let projects: [Project] = [
        Project(title: "Productivity Pro"),
        Project(title: "Vitality Pro"),
        Project(title: "Urban Green"),
        Project(title: "stoobit search"),
        Project(title: "stoobit share"),
    ]
}

struct Project {
    var title: String
}
