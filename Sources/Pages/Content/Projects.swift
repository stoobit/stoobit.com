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
        ForEach(projects) { project in
            ImageModal(project: project)
        }
        
        VStack(alignment: .leading, spacing: 30) {
            Text("Projects")
                .font(.title1)
                .fontWeight(.bold)

            Grid(spacing: 20) {
                ForEach(projects) { project in
                    VStack {
                        ZStack {
                            Image("")
                            
                            VStack(alignment: .trailing) {
                                let size: Int = 40
                                Span {
                                    Image("/icons/photo.svg")
                                        .resizable()
                                        .style(.width, "50%")
                                        .style(.height, "50%")
                                }
                                .style(.width, "\(size)px")
                                .style(.height, "\(size)px")
                                .background(Material.ultraThickMaterial)
                                .style(.borderRadius, "50%")
                                .style(.display, "flex")
                                .style(.justifyContent, "center")
                                .style(.alignItems, "center")
                                .cursor(.pointer)
                                .onClick {
                                    ShowModal(id: project.id)
                                }
                            }
                            .padding(9)
                            .frame(
                                minWidth: .percent(100%),
                                minHeight: .percent(100%),
                                alignment: .topLeading
                            )
                        }
                        .frame(minWidth: .percent(100%), minHeight: .px(200))
                        .background(Color.red)
                        
                        VStack {
                            VStack(alignment: .leading) {
                                Text(project.title)
                                    .font(.title3)
                                    .fontWeight(.bold)
                            }
                            .frame(minWidth: .percent(100%))
                            
                           
                        }
                        .frame(minWidth: .percent(100%))
                        .padding(20)
                    }
                    .frame(minWidth: .px(330))
                    .clipped()
                    .cornerRadius(27)
                    .background(Color(hex: "#F5F5F8"))
                }
            }
        }
        .padding(40)
        .ignorePageGutters()
    }
    
    let projects: [Project] = [
        Project(title: "Productivity Pro", headerImage: ""),
        Project(title: "Vitality Pro", headerImage: ""),
        Project(title: "Urban Green", headerImage: ""),
        Project(title: "stoobit search", headerImage: ""),
        Project(title: "stoobit share", headerImage: ""),
    ]
    
    func ImageModal(project: Project) -> some HTML {
        Modal(id: project.id) {
            Section {
                Button().role(.close).onClick {
                    DismissModal(id: project.id)
                }
            }
            .horizontalAlignment(.trailing)

            Text(project.title)
                .horizontalAlignment(.center)
                .font(.title3)
                .margin(.xLarge)
        }
        .size(.xLarge)
        .style(.borderRadius, "60px")
    }
}

struct Project: Identifiable {
    var id: String = UUID().uuidString
    
    var title: String
    
    var headerImage: String
}
